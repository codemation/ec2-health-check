def run(server):
    try:
        from apps import setup
        setup.run(server)
        from dbs import setup as dbsetup
        dbsetup.run(server)
    except Exception as e:
        print("Project may not have any apps configured or apps setup.py cannot be found")
        print(repr(e))
