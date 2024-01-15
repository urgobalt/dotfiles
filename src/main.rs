use clap::{ArgGroup, Args, Parser};

#[derive(Parser)]
#[clap(name = "Dotfile Manager")]
struct Cli {
    #[clap(flatten)]
    primary_action: PrimaryAction,
    #[clap(flatten)]
    sync_direction: SyncDirection,
    #[clap(flatten)]
    file_type: FileType,
    #[clap(short='f', long, requires_all=["file_type", "file_action"])]
    file: std::path::PathBuf,
}

#[derive(Debug, Args)]
#[group(required = true, multiple = false, id = "primary_action")]
#[clap(group(ArgGroup::new("file_action").args(["add", "remove"]).requires_all(["file_type", "file"])))]
struct PrimaryAction {
    #[clap(short = 'S', long, requires = "sync_direction")]
    sync: bool,
    #[clap(short = 'A', long)]
    add: bool,
    #[clap(short = 'R', long)]
    remove: bool,
}

#[derive(Debug, Args)]
#[group(requires = "sync", multiple = false, id = "sync_direction")]
struct SyncDirection {
    #[clap(short = 'F', long)]
    from_filesystem: bool,
    #[clap(short = 'D', long)]
    from_dotfiles: bool,
}

#[derive(Debug, Args)]
#[group(requires_all = ["file_action", "file"], multiple = false, id="file_type")]
struct FileType {
    #[clap(short = 's', long)]
    secret: bool,
    #[clap(short = 'c', long)]
    config: bool,
}

pub fn main() {
    let cli = Cli::parse();

    if cli.primary_action.sync {
        if cli.sync_direction.from_dotfiles {

        } else if cli.sync_direction.from_filesystem {

        } else {
            unreachable!()
        }
    } else {
        let file = std::env::var_os("DOTFILES_DIR");
    }
}
