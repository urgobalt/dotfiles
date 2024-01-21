use std::path::PathBuf;

use thiserror::Error;

#[derive(Error, Debug)]
pub(crate) enum OptionInputConversionError {
    #[error("No primary action found")]
    MissingPrimaryAction,
    #[error("Multiple primary actions found")]
    MultiplePrimaryAction,
    #[error("No file found")]
    MissingFile,
    #[error("No file type found")]
    MissingFileType,
    #[error("Multiple file types found")]
    MultipleFileTypes,
    #[error("No sync direction found")]
    MissingSyncDirection,
    #[error("Multiple sync directions found")]
    MultipleSyncDirections,
}

#[derive(Error, Debug)]
pub(crate) enum ApplicationError {
    #[error("'{0}' not found")]
    ConfigFileMissing(PathBuf),
    #[error("Unable to read config file: '{0}'")]
    ConfigFileReadError(PathBuf),
    #[error("File not found: '{0}'")]
    FileNotFound(PathBuf),
    #[error("File is not a dotfile, but is a symlink: '{0}'")]
    UntrackedSymlinkedFile(PathBuf),
    #[error("Unable to move/rename file '{from}' to '{to}'")]
    FailedRenamingFile { err: std::io::Error, from: PathBuf, to: PathBuf },
    #[error("Root cannot contain configuration files: '{0}'")]
    FileInRoot(PathBuf),
    #[error("Could not open file for edit: '{0}'")]
    CouldNotOpenFile(PathBuf, std::io::Error),
    #[error("An error occured while writing to file '{0}'")]
    FailedWritingToFile(PathBuf, std::io::Error),
    #[error("Failed converting Path object to a string '{0}'")]
    PathConversionError(PathBuf),
    #[error("Failed reading file '{0}'")]
    ErrorReadingFile(PathBuf),
}
