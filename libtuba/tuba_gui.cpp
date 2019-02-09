#include <gui/BufferQueue.h>
#define LOG_TAG "HW_UI_SHIM"
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <pthread.h>
#include <ui/GraphicBufferMapper.h>
#include <ui/PixelFormat.h>
//#include <ui/Rect.h>
#include <log/log.h>
#include <dlfcn.h>

extern "C" {

#ifdef __LP64__
    void _ZN7android18BufferItemConsumerC2ERKNS_2spINS_22IGraphicBufferConsumerEEEmib(const android::sp<android::IGraphicBufferConsumer>&, uint64_t, int, bool);

    void _ZN7android18BufferItemConsumerC1ERKNS_2spINS_22IGraphicBufferConsumerEEEjib(const android::sp<android::IGraphicBufferConsumer>& consumer, uint32_t consumerUsage, int bufferCount, bool controlledByApp) {
        _ZN7android18BufferItemConsumerC2ERKNS_2spINS_22IGraphicBufferConsumerEEEmib(consumer, static_cast<uint64_t>(consumerUsage), bufferCount, controlledByApp);
    }
#else
    void _ZN7android18BufferItemConsumerC2ERKNS_2spINS_22IGraphicBufferConsumerEEEyib(const android::sp<android::IGraphicBufferConsumer>&, uint64_t, int, bool);

    void _ZN7android18BufferItemConsumerC1ERKNS_2spINS_22IGraphicBufferConsumerEEEjib(const android::sp<android::IGraphicBufferConsumer>& consumer, uint32_t consumerUsage, int bufferCount, bool controlledByApp) {
        _ZN7android18BufferItemConsumerC2ERKNS_2spINS_22IGraphicBufferConsumerEEEyib(consumer, static_cast<uint64_t>(consumerUsage), bufferCount, controlledByApp);
    }
#endif
}
