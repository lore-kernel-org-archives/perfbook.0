Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiKTSXS (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 20 Nov 2022 13:23:18 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66DD313CE9
        for <perfbook@vger.kernel.org>; Sun, 20 Nov 2022 10:23:17 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id n12so23982253eja.11
        for <perfbook@vger.kernel.org>; Sun, 20 Nov 2022 10:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cJBAZX5rf5QPxrqUqUMmJKAJqzXZ70Pu7zwGfxKhoDc=;
        b=QU118zbbO6BnQq9LjUiv7x8DMP1PynLhAFPPwHX4DYr/tW0ngrnBzcZz0Isbv6IOC6
         mUUe8QGAV2kbqpJPBaDeVrHUbrzevr525aYOvHk+/KL0P77is12gjmhf5lkRBX1bJo13
         kL/VU7XQ26w1di/X6zO83tn/c4rTp75FRGoumfcHQe2/o492VFgCaecRYIYpU45qHLMI
         pDXEaQ9IA6cPBtF8+Z3jyP/jc6ATay/V4/LtdUdimmlGUIx4xdd1vzDfmqMur3bu7rMf
         TD0F2eNKvfogmu12L94f+N4J/F8HhjyRfAeVF1NuJ+tNht+g7grWTNGyMOjfZ825kDCO
         N5cA==
MIME-Version: 1.0
References: <CAJbg=FWTVdoZr2uzDeSMcUE-0EGQbFgtVR6NvoRQ9Y+P1LSoRQ@mail.gmail.com>
In-Reply-To: <CAJbg=FWTVdoZr2uzDeSMcUE-0EGQbFgtVR6NvoRQ9Y+P1LSoRQ@mail.gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
Date: Sun, 20 Nov 2022 13:23:03 -0500
Message-ID: <CAJbg=FVh9H+Qo-oiH1W-G4hrcpM=-QWTJFO8s7Z7PYNrVedCSQ@mail.gmail.com>
Subject: Re: Hazard pointers: suspicious dereference
Content-Type: text/plain; charset="UTF-8"
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi Paul,

Any comments on this one? I can submit a patch, but it's possible I'm
missing something here.

--Elad

On Sun, 13 Nov 2022 at 10:20, Elad Lahav <e2lahav@gmail.com> wrote:
>
> hp_try_record() takes a pointer to a pointer, casts it to void **, and
> then passes it to _h_t_r_impl(). So far so good.
>
> hp_record() takes a pointer to a pointer, but dereferences it when
> calling hp_try_record(). That seems odd to me. Let's say we have a
> structure foo_t, and a pointer to it, foo_p. Then
>
> hp_record((void **)&foo_p, hp)  =>
> hp_try_record(*p, hp) // p is pointer to pointer to foo_s =>
> _h_t_r_impl((void **)p, hp) // p is a pointer to foo_s, cast as (void **) =>
> tmp = READ_ONCE(*p) // reading from the first bytes of foo_s as an address
>
> I also tried building the example route_hazard.c such that it uses
> hp_record() instead of hp_try_record(), and it crashes as I expected.
>
> Am I missing something?
>
> --Elad
