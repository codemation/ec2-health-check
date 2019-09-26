def run(server):
    @server.route("/healthz")
    def healthz_func():
        import os
        os.system('hostname > host')
        host = ''
        with open('host', 'r') as h:
            for line in h:
                host = host + line
        return "200/Ok from %s"%(host)
