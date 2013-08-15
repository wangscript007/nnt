
# import <Foundation/Foundation.h>
# import <nnt/Foundation+NNT.h>

NNT_EXTERN void process_loop(void);
NNT_EXTERN void usage(void);
NNT_EXTERN void version(void);
NNT_EXTERN bool check_quit(::std::string const&);
NNT_EXTERN bool load_theme(::std::string const&);
NNT_EXTERN bool find_key(::std::string const&);
NNT_EXTERN bool list_all(::std::string const&);
NNT_EXTERN bool close_theme(::std::string const&);

NNT_STATIC UITheme* gs_theme = nil;

int main (int argc, const char * argv[])
{
    @autoreleasepool {        
        [NNT Init];
        process_loop();
        [NNT Fin];
    }
    return 0;
}

void process_loop() 
{
    version();
    
    ::std::string input;
    
    while (1) 
    {
        ::std::cout << "$";
        ::std::cin >> input;
        
        if (check_quit(input))
            break;
        
        if (0) { PASS; }
        
        else if (load_theme(input)) {}
        else if (find_key(input)) {}
        else if (list_all(input)) {}
        else if (close_theme(input)) {}
        
        else { usage(); }
    }
    
    // clear
    zero_release(gs_theme);
    
    ::std::cout << "Goodbye" << ::std::endl;
}

bool check_quit(::std::string const& str)
{
    return str == "q" || str == "quit";
}

void usage()
{
    ::std::cout << "usage:" << ::std::endl <<
    "[q|quit] exit this program." << ::std::endl <<
    "[load] <path of theme> load theme." << ::std::endl <<
    "[find] <key> find obj associated by key." << ::std::endl <<
    "[ls|list] list all object with key." << ::std::endl <<
    "[close] close theme." << ::std::endl
    ;
}

void version()
{
    ::std::cout << "The theme editor for uikit-theme file." << ::std::endl;
}

bool load_theme(::std::string const& input)
{
    if (input != "load") return false;
    ::std::string file;
    ::std::cin >> file;
    zero_release(gs_theme);
    // load
    gs_theme = [[UITheme alloc] init];
    if (![gs_theme loadTheme:[NSString stringWithCString:file.c_str() encoding:NSASCIIStringEncoding] type:NNTDirectoryTypeAbsolute])
    {
        zero_release(gs_theme);
    }
    return true;
}

bool find_key(::std::string const& input)
{
    if (input != "find") return false;
    ::std::string key;
    ::std::cin >> key;
    id obj = [gs_theme instanceObject:key.c_str()];
    if (obj)
    {
        ::std::cout << "found " << object_getClassName(obj) << " object" << ::std::endl;
    } 
    else 
    {
        ::std::cout << "no object" << ::std::endl;
    }
    return true;
}

NNT_EXTERN bool list_all_func(char const* key, uint klen, id obj);
bool list_all_func(char const* key, uint klen, id obj)
{
    ::std::cout << "key is: [" << key << "] object is: [" << object_getClassName(obj) << "]" << ::std::endl;
    return true;
}

bool list_all(::std::string const& input)
{
    if (input != "list" && input != "ls") return false;
    [gs_theme walk:list_all_func];
    return true;
}

bool close_theme(::std::string const& input)
{
    if (input != "close") return false;
    zero_release(gs_theme);
    return true;
}