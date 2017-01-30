#!/usr/bin/env python3
import argparse
import re
import subprocess
import sys
import os

SOURCE_ORIGIN="keegan@keegpi.hopto.org:"
SOURCE_PATH="/pi/usr1"

SYNC_COMMAND="rsync -avz -e ssh --progress"
DIRECTION_TO="to"
DIRECTION_FROM="from"

def run_sync(args, dryrun=False):
    cmd = re.findall(r'(?:[^\s,\'"]|["\'](?:\\.|[^"])*["\'])+', args.command);

    cmd.append('--itemize-changes')
    if dryrun:
        cmd.append('--dry-run')

    if (args.direction == DIRECTION_FROM):
        for item in args.items:
            cmd.append(args.origin + os.path.join(args.path, item))
        cmd.append(args.cd)
    elif (args.direction == DIRECTION_TO):
        for item in args.items:
            cmd.append(os.path.join(args.cd, item))
        cmd.append(args.origin + args.path)
    else:
        print("Invalid direction {}".format(args.direction))
        return 1
    if args.verbose:
        print(cmd)
    # TODO: Throw exception if fails
    return subprocess.check_call(cmd)

def confirm_prompt():
    while True:
        print("Run operation? [y/N] ", end='')
        choice=input().strip().strip('n\r').upper()
        if choice == 'Y':
            return True
        elif choice == 'N':
            return False
        elif choice == '':
            return False
        else:
            print("Invalid input")


def main():
    parser=argparse.ArgumentParser(description='Raspberry Pi Sync script')
    parser.add_argument('--origin', '-o',
        help="Host address to sync to/from",
        default=SOURCE_ORIGIN
    )
    parser.add_argument('--cd', '-c',
        help="Location on current machine to synchronize to/from",
        default='.'
    )
    parser.add_argument('--command', '-C',
        help="Command to use to synchronize files",
        default=SYNC_COMMAND
    )
    parser.add_argument('--path', '-p',
        help="Location on host to sync to/from",
        default=SOURCE_PATH
    )
    parser.add_argument('--dry-run', '-n',
        help="Perform a dryrun instead of synchronizing files",
        action='store_true'
    )
    parser.add_argument('--force', '-f',
        help="Perform operation without confirmation prompt",
        action='store_true'
    )
    parser.add_argument('--verbose', '-v',
        help="Verbose output",
        action='store_true'
    )
    parser.add_argument('direction',
        help="Sync to the host or from the host",
        choices=[DIRECTION_TO, DIRECTION_FROM]
    )
    parser.add_argument('items',
        help="Files/directories on host to sync",
        nargs='+'
    )
    args = parser.parse_args()
    if args.dry_run:
        run_sync(args, dryrun=True)
    else:
        if args.force:
            run_sync(args, dryrun=False)
        else:
            run_sync(args, dryrun=True)
            if confirm_prompt():
                print("Performing synchronization")
                run_sync(args, dryrun=False)
            else:
                print("Synchronization aborted")

if __name__ == "__main__":
    sys.exit(main())
