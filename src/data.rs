use std::path::PathBuf;

use crate::{error::OptionInputConversionError, cli::Cli};

#[derive(Debug)]
pub(crate) enum PrimaryAction {
    Sync { direction: SyncDirection },
    Add { file: PathBuf, file_type: FileType },
    Remove { file: PathBuf, file_type: FileType },
}

impl TryFrom<Cli> for PrimaryAction {
    type Error = OptionInputConversionError;

    fn try_from(value: Cli) -> Result<Self, Self::Error> {
        Ok(
            match (
                value.primary_action.add,
                value.primary_action.remove,
                value.primary_action.sync,
            ) {
                (true, false, false) | (false, true, false) => {
                    let file = value.file.ok_or(OptionInputConversionError::MissingFile)?;
                    let file_type = match (value.file_type.secret, value.file_type.config) {
                        (true, false) => FileType::Secret,
                        (false, true) => FileType::Config,
                        (false, false) => return Err(OptionInputConversionError::MissingFileType),
                        _ => return Err(OptionInputConversionError::MultipleFileTypes),
                    };
                    match (value.primary_action.add, value.primary_action.remove) {
                        (true, false) => PrimaryAction::Add { file, file_type },
                        (false, true) => PrimaryAction::Remove { file, file_type },
                        _ => unreachable!(),
                    }
                }
                (false, false, true) => {
                    let direction = match (
                        value.sync_direction.from_dotfiles,
                        value.sync_direction.from_filesystem,
                    ) {
                        (true, false) => SyncDirection::FromDotfiles,
                        (false, true) => SyncDirection::FromFilesystem,
                        (false, false) => {
                            return Err(OptionInputConversionError::MissingSyncDirection)
                        }
                        _ => return Err(OptionInputConversionError::MultipleSyncDirections),
                    };
                    PrimaryAction::Sync { direction }
                }
                (false, false, false) => {
                    return Err(OptionInputConversionError::MissingPrimaryAction)
                }
                _ => return Err(OptionInputConversionError::MultiplePrimaryAction),
            },
        )
    }
}

#[derive(Debug)]
pub(crate) enum SyncDirection {
    FromFilesystem,
    FromDotfiles,
}

#[derive(Debug)]
pub(crate) enum FileType {
    Config,
    Secret,
}
