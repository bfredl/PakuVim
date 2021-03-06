#ifndef NEOVIM_CPP__NVIM_UI_HPP
#define NEOVIM_CPP__NVIM_UI_HPP

#include "nvim_rpc.hpp"

namespace nvim
{

class nvim_ui
{

protected:
    NvimRPC ui_client_;

    virtual void connect_tcp_ui(const String& host, const String& service, double timeout_sec=100)
    {
        ui_client_.connect_tcp(host, service, timeout_sec);
    }

    virtual void nvim_ui_attach (Integer width, Integer height, const Dictionary& options)
    {
        ui_client_.call("nvim_ui_attach", nullptr, width, height, options);
    }

    virtual void ui_attach (Integer width, Integer height, bool enable_rgb)
    {
        ui_client_.call("ui_attach", nullptr, width, height, enable_rgb);
    }

    virtual void nvim_ui_detach ()
    {
        ui_client_.call("nvim_ui_detach", nullptr);
    }

    virtual void nvim_ui_try_resize (Integer width, Integer height)
    {
        ui_client_.call("nvim_ui_try_resize", nullptr, width, height);
    }

    virtual void nvim_ui_set_option (const String& name, const Object& value)
    {
        ui_client_.call("nvim_ui_set_option", nullptr, name, value);
    }

    std::size_t available(){ return ui_client_.available(); }

};

}


#endif
