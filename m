Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mail-it1-f178.google.com ([209.85.166.178]:51661 "EHLO
        mail-it1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfDZLXe (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 26 Apr 2019 07:23:34 -0400
Received: by mail-it1-f178.google.com with SMTP id s3so5263686itk.1
        for <perfbook@vger.kernel.org>; Fri, 26 Apr 2019 04:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=dtaG133iLZxek5rtMRAPbGf9xQ6WlNZkTsjwisDxuR0=;
        b=vWKOYO7Fu6eXV9xvd+h06qyVs9EE1iwPXZ9QFIWS1oinV0Rqt053265yaLr/4JZ8pT
         dwfmaRpuH/I9rsnI+BphOFFZVsfGLdPEvBpgeutAJPqZDEgbU3M40FEZ7NHJtFdbYvgr
         XQP9MabsdPe++jwWFwSMi24JxKw8CCHeEi5lnr5JUDCuMKP0DpZrlwMlIX3YQ9QnBEma
         Bix5OdMFf2S8RVTFzhiQkGLp16HgJKkOYruSqVm16daxCmxEfxrIyxUyMQ511oJ4LLWp
         5zVCJ5ll4NqC4IZMwZq+ZJH48vyaPEEofCDTOniAFiP/vWqH4v/x7xIH2b/tN9tB14Oj
         Kmpw==
MIME-Version: 1.0
From: Elad Lahav <e2lahav@gmail.com>
Date: Fri, 26 Apr 2019 07:23:20 -0400
Message-ID: <CAJbg=FVgUTZqD2Xda17Lbk-6xc_GkRX8c_iqYx8W-vuBnfyutA@mail.gmail.com>
Subject: POSIX Proess Creation and Destruction nit-picking
Content-Type: text/plain; charset="UTF-8"
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

The following issues may not be deemed important enough to fix, but
I'll point them out nevertheless:

- kill() does not destroy a process, but merely sends a signal. The
action taken by the process upon the delivery of the signal depends on
the signal itself, whether it is currently masked, and whether the
process has installed a signal handler. The only signal guaranteed to
destroy a process is SIGKILL, which may not be masked and cannot be
associated with a handler.
- "It is critically important to note that the parent and child do not
share memory." - That is not true. Parent and child share all memory
marked as shared (i.e., mappings created with mmap(MAP_SHARED)). The
example works because by default the BSS is mapped as private.
- Listing 4.2 could have just used waitpid() instead of the loop.

If I were really a nit-picking person I would have pointed out the
various places in chapters 2 and 3 where infinitives are being split,
but I'm not so I won't ;-).

--Elad

