/*
 *      Copyright (C) 2012 Team XBMC
 *      http://www.xbmc.org
 *
 *  This Program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2, or (at your option)
 *  any later version.
 *
 *  This Program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with XBMC; see the file COPYING.  If not, write to
 *  the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
 *  http://www.gnu.org/copyleft/gpl.html
 *
 */

#pragma once

#if (defined HAVE_CONFIG_H) && (!defined WIN32)
  #include "config.h"
#elif defined(_WIN32)
#include "system.h"
#endif

#if defined(HAS_MARVELL_DOVE)
#include "DynamicDll.h"

extern "C"
{
#include <marvell-ipp/codecVC.h>
#include <marvell-ipp/vdec_os_api.h>
#include <marvell-ipp/misc.h>
}

class DllLibMiscGenInterface
{
public:
  virtual ~DllLibMiscGenInterface() {}
  virtual int miscInitGeneralCallbackTable(MiscGeneralCallbackTable **ppDstCBTable) = 0;
  virtual int miscFreeGeneralCallbackTable(MiscGeneralCallbackTable **ppSrcCBTable) = 0;
};

class DllLibMiscGen : public DllDynamic, DllLibMiscGenInterface
{
  DECLARE_DLL_WRAPPER(DllLibMiscGen, "/usr/lib/libmiscgen.so")

  DEFINE_METHOD1(int, miscInitGeneralCallbackTable, (MiscGeneralCallbackTable **p1))
  DEFINE_METHOD1(int, miscFreeGeneralCallbackTable, (MiscGeneralCallbackTable **p1))

  BEGIN_METHOD_RESOLVE()
    RESOLVE_METHOD(miscInitGeneralCallbackTable)
    RESOLVE_METHOD(miscFreeGeneralCallbackTable)
  END_METHOD_RESOLVE()
};

class DllLibVMETAInterface
{
public:
  virtual ~DllLibVMETAInterface() {}
  virtual IppCodecStatus DecoderPushBuffer_Vmeta(IppVmetaBufferType nBufType, void *pBufPtr, void *pSrcDecoderState) = 0;
  virtual IppCodecStatus DecoderPopBuffer_Vmeta(IppVmetaBufferType nBufType, void **ppBufPtr, void *pSrcDecoderState) = 0;
  virtual IppCodecStatus DecoderInitAlloc_Vmeta(IppVmetaDecParSet *pVmetaDecParSet,
                                                MiscGeneralCallbackTable *pSrcCallbackTable, void **ppDstDecoderState) = 0;
  virtual IppCodecStatus DecoderFree_Vmeta(void **pSrcDecoderState) = 0;
  virtual IppCodecStatus DecodeSendCmd_Vmeta(int cmd, void *pInParam, void *pOutParam, void *pSrcDecoderState) = 0;
  virtual IppCodecStatus DecodeFrame_Vmeta(IppVmetaDecInfo *pDecInfo, void *pSrcDstDecoderState) = 0;
  virtual void *vdec_os_api_dma_alloc(UNSG32 size, UNSG32 align, UNSG32 *pPhysical) = 0;
  virtual void *vdec_os_api_dma_alloc_cached(UNSG32 size, UNSG32 align, UNSG32 *pPhysical) = 0;
  virtual void *vdec_os_api_dma_alloc_writecombine(UNSG32 size, UNSG32 align, UNSG32 *pPhysical) = 0;
  virtual void vdec_os_api_dma_free(void *ptr) = 0;
  virtual SIGN32 vdec_os_api_suspend_check(void) = 0;
  virtual void vdec_os_api_suspend_ready(void) = 0;
};

class DllLibVMETA : public DllDynamic, DllLibVMETAInterface
{
  DECLARE_DLL_WRAPPER(DllLibVMETA, "/usr/lib/libcodecvmetadec.so")

  DEFINE_METHOD3(IppCodecStatus, DecoderPushBuffer_Vmeta, (IppVmetaBufferType p1, void *p2, void *p3))
  DEFINE_METHOD3(IppCodecStatus, DecoderPopBuffer_Vmeta,  (IppVmetaBufferType p1, void **p2, void *p3))
  DEFINE_METHOD3(IppCodecStatus, DecoderInitAlloc_Vmeta,  (IppVmetaDecParSet *p1, MiscGeneralCallbackTable *p2, void **p3))
  DEFINE_METHOD1(IppCodecStatus, DecoderFree_Vmeta,       (void **p1))
  DEFINE_METHOD4(IppCodecStatus, DecodeSendCmd_Vmeta,     (int p1, void *p2, void *p3, void *p4))
  DEFINE_METHOD2(IppCodecStatus, DecodeFrame_Vmeta,       (IppVmetaDecInfo *p1, void *p2))
  DEFINE_METHOD3(void *,         vdec_os_api_dma_alloc,   (UNSG32 p1, UNSG32 p2, UNSG32 *p3))
  DEFINE_METHOD3(void *,         vdec_os_api_dma_alloc_cached,   (UNSG32 p1, UNSG32 p2, UNSG32 *p3))
  DEFINE_METHOD3(void *,         vdec_os_api_dma_alloc_writecombine,   (UNSG32 p1, UNSG32 p2, UNSG32 *p3))
  DEFINE_METHOD1(void,           vdec_os_api_dma_free,    (void *p1))
  DEFINE_METHOD0(SIGN32,         vdec_os_api_suspend_check)
  DEFINE_METHOD0(void,           vdec_os_api_suspend_ready)

  BEGIN_METHOD_RESOLVE()
    RESOLVE_METHOD(DecoderPushBuffer_Vmeta)
    RESOLVE_METHOD(DecoderPopBuffer_Vmeta)
    RESOLVE_METHOD(DecoderInitAlloc_Vmeta)
    RESOLVE_METHOD(DecoderFree_Vmeta)
    RESOLVE_METHOD(DecodeSendCmd_Vmeta)
    RESOLVE_METHOD(DecodeFrame_Vmeta)
    RESOLVE_METHOD(vdec_os_api_dma_alloc)
    RESOLVE_METHOD(vdec_os_api_dma_alloc_cached)
    RESOLVE_METHOD(vdec_os_api_dma_alloc_writecombine)
    RESOLVE_METHOD(vdec_os_api_dma_free)
    RESOLVE_METHOD(vdec_os_api_suspend_check)
    RESOLVE_METHOD(vdec_os_api_suspend_ready)
  END_METHOD_RESOLVE()
};
#endif
