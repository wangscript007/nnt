
# include "stdafx.h"
# include <nnt/Foundation+NNT.h>
# include <nnt/Cross/HttpServer.h>
# include <nnt/Parser/HttpParser.h>

NNTAPP_BEGIN

class Web
    : public cxx::Object<>
{
public:

    Web()
    {
        srv.config.addr = "localhost:18888";
        srv.connect(cross::kSignalNewConnection, _action(Web::act_web), this);
    }

    void start()
    {
        srv.start();
    }

    void act_web(eventobj_t& evt)
    {
        parser::Http11Response resp;
        resp.data.append("In-App Web Server");
        cross::HttpConnection& cnt = evt;
        cnt.write(resp.full());
    }

    cross::HttpServer srv;

};

NNTAPP_END

int _tmain(int argc, _TCHAR* argv[])
{
    ::nntapp::Web web;
    web.start();

    getchar();
	return 0;
}
