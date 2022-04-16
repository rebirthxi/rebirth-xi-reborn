# Tools
import os
import time
from mysql.connector import connect
from mysql.connector import errorcode
from mysql.connector import Error as MySqlError
import colorama
from colorama import Fore, Style

# Migrations
from migrations import spell_blobs_to_spell_table
from migrations import unnamed_flags
from migrations import char_unlock_table_columns
from migrations import HP_masks_to_blobs
from migrations import crystal_storage
from migrations import broken_linkshells
from migrations import spell_family_column
from migrations import mission_blob_extra
from migrations import cop_mission_ids
from migrations import add_daily_tally_column
from migrations import add_timecreated_column
from migrations import extend_mission_log
from migrations import eminence_blob
from migrations import char_timestamp
from migrations import currency_columns
from migrations import add_instance_zone_column
from migrations import convert_tables_to_innodb
from migrations import char_points_weekly_unity
from migrations import char_profile_unity_leader
from migrations import convert_mission_status
from migrations import convert_zilart_status
from migrations import add_job_master_column_chars
from migrations import currency2
from migrations import languages
from migrations import add_field_chocobo_column
from migrations import add_new_wardrobe_columns
from migrations import abyssea_unlocks
from migrations import add_char_chatfilters
from migrations import abyssea_conflux


migrations = [
    unnamed_flags,
    spell_blobs_to_spell_table,
    char_unlock_table_columns,
    HP_masks_to_blobs,
    crystal_storage,
    broken_linkshells,
    spell_family_column,
    extend_mission_log,
    mission_blob_extra,
    cop_mission_ids,
    add_daily_tally_column,
    add_timecreated_column,
    eminence_blob,
    char_timestamp,
    currency_columns,
    add_instance_zone_column,
    convert_tables_to_innodb,
    char_points_weekly_unity,
    char_profile_unity_leader,
    convert_mission_status,
    convert_zilart_status,
    add_job_master_column_chars,
    currency2,
    languages,
    add_field_chocobo_column,
    add_new_wardrobe_columns,
    abyssea_unlocks,
    add_char_chatfilters,
    abyssea_conflux,
]


def main():
    colorama.init(autoreset=True)

    try:
        db, cursor = create_mysql_db_and_cursor()
        perform_migrations(db, cursor)
    except MySqlError as err:
        print(f"Migration script failing with error: {err}")
        return -1


def create_mysql_db_and_cursor():
    db = connect(
        host=os.getenv('DB_HOST') or "localhost",
        port=3306,
        user=os.getenv('DB_USER') or "",
        passwd=os.getenv('DB_USER_PASSWD') or "",
        db=os.getenv('DB_NAME') or "",
        use_pure=True
    )
    cursor = db.cursor()

    return db, cursor


def perform_migrations(db, cursor):
    migrations_needed = []
    print(Fore.GREEN + 'Checking migrations...')
    for migration in migrations:
        check_migration(migration, migrations_needed, cursor)
    if len(migrations_needed) > 0:
        if os.path.exists('migration_errors.log'):
            os.remove('migration_errors.log')
        for migration in migrations_needed:
            print('Running migrations for ' + migration.migration_name() + '...')
            migration.migrate(cursor, db)
        print(Fore.GREEN + 'Finished migrations!')
        if os.path.exists('migration_errors.log'):
            print(Fore.RED + 'There were errors with some migrations, this likely means one or more characters \n'
                             'have corrupt data in some field. See migration_errors.log for more details.')
        time.sleep(0.5)
    else:
        print(Fore.GREEN + 'No migrations required.')
        time.sleep(0.5)


def check_migration(migration, migrations_needed, cursor):
    migration.check_preconditions(cursor)
    if not migration.needs_to_run(cursor):
        print(Fore.RED + '[' + Fore.GREEN + '*' + Fore.RED + '] ' + Style.RESET_ALL + migration.migration_name())
        return
    migrations_needed.append(migration)
    print(Fore.RED + '[ ] ' + Style.RESET_ALL + migration.migration_name())


if __name__ == "__main__":
    main()
