Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233401AbiKMPUd (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 13 Nov 2022 10:20:33 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE73F55B5
        for <perfbook@vger.kernel.org>; Sun, 13 Nov 2022 07:20:32 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id n12so22738510eja.11
        for <perfbook@vger.kernel.org>; Sun, 13 Nov 2022 07:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gSUWhqzMz+JqUfXR+psd6Z1eeKhV/0eAoQ1FXx5KelQ=;
        b=cd6FPRB6x/cQF1JeiZGIvQIQYW3l5hpKftxOVflSZIj/dOlVeWW03EFLPu7TzOhpep
         zxe4/ASbQyqGgm9wP5GgYs9KNDBtC/1bGm48YNhnSffoJaDb30j43esNuVG3wsJ/q1fh
         Gy4+i+t2cdOd35IgZ+aB8m6/pZj6sx+xUV45RV4zrT1gSiRimSX77Xb/q1smb+203pHa
         wqbJBWFReI4G0aFFPe653Km39xiKqq4Q3kv+thnJ42sUI6SRMuJsaHHLUNCeWEQMF8tp
         OOSU9IhXdSDybldVjPtwe5XLOPQrx5W3fcNdv3CbxHtq19vR7m8F8OPn6c08YSN0+kjQ
         vA3Q==
MIME-Version: 1.0
From: Elad Lahav <e2lahav@gmail.com>
Date: Sun, 13 Nov 2022 10:20:18 -0500
Message-ID: <CAJbg=FWTVdoZr2uzDeSMcUE-0EGQbFgtVR6NvoRQ9Y+P1LSoRQ@mail.gmail.com>
Subject: Hazard pointers: suspicious dereference
Content-Type: text/plain; charset="UTF-8"
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

hp_try_record() takes a pointer to a pointer, casts it to void **, and
then passes it to _h_t_r_impl(). So far so good.

hp_record() takes a pointer to a pointer, but dereferences it when
calling hp_try_record(). That seems odd to me. Let's say we have a
structure foo_t, and a pointer to it, foo_p. Then

hp_record((void **)&foo_p, hp)  =>
hp_try_record(*p, hp) // p is pointer to pointer to foo_s =>
_h_t_r_impl((void **)p, hp) // p is a pointer to foo_s, cast as (void **) =>
tmp = READ_ONCE(*p) // reading from the first bytes of foo_s as an address

I also tried building the example route_hazard.c such that it uses
hp_record() instead of hp_try_record(), and it crashes as I expected.

Am I missing something?

--Elad
