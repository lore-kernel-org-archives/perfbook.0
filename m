Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbiHKBXJ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 10 Aug 2022 21:23:09 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43402844EA
        for <perfbook@vger.kernel.org>; Wed, 10 Aug 2022 18:23:08 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a7so30951132ejp.2
        for <perfbook@vger.kernel.org>; Wed, 10 Aug 2022 18:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=zJhHcqrEw7wQxZYpezFPEuGpM8pj6Q6oPBUunKYSqc8=;
        b=SmgEfFOPWh+wEG/MRW3fyXv+jdDFuds3y+6a7e9AP5ciDThKPQsVs/BDN479BQako7
         6o5CKoFeYWIro4W9y7geAzrJ5ZSHK8bYl7LgZZKrZKZroaOfBFJ2/QG+48vrKLJlGioc
         JVNdfn3tH1by6UK9an3X0HH1rQWa+/n49tdTAWPl/DOkFNK9T3AM8FddWqUA0UFOOdy/
         PqOo0ixdUBxFx32846V/9XdMmy6LxbKlihd3frRHyOAZ/r1A/FlPD8HnGZoziyCbGuNv
         Qwkztjk4AVkRB/PsKYPNC4T+oOPIt7kOVEMa3e4nNhAofb+VxbK6fIw10tNql7o4w85n
         ZS4Q==
MIME-Version: 1.0
From: Elad Lahav <e2lahav@gmail.com>
Date: Wed, 10 Aug 2022 21:22:53 -0400
Message-ID: <CAJbg=FUxuy++utmmuGpetP2wMk_Hc8UVYu74JWucmw9kxdM57A@mail.gmail.com>
Subject: Comments on chapter 5
Content-Type: text/plain; charset="UTF-8"
List-ID: <perfbook.vger.kernel.org>
To: "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>

Hi Paul,

I have a few comments on chapter 5. If you agree with any of them I
can try to provide a patch.

5.2.2: Not really related to counters. Is it really possible for the
compiler to use any location for temporary storage, even global
variables? That seems a bit excessive on the compiler's part. I have
definitely seen GCC reuse stack storage, but even then only when it
thought that the previous value there was out of scope (erroneously in
my case, as the function behaved like setjmp()).

5.2.3: Perhaps the code should be updated to use ISO C instead of GCC?
_Thread_local and inline are part of the language.

Listing 5.5: There is a mix of thread_id_t from CodeSamples and
pthread_create() from POSIX. One of those should be changed.

5.2.4: The wording suggests that the counting threads are not impacted
by the reader. But doesn't a cache line changing from Modified to
Shared incur a cost on the counter when it next comes to update the
value?

5.3.2: "references only per-thread variables, and should not incur any
cache misses" - except that the thread can migrate to other cores and
can thus incur cache misses.

5.3.3: I think that some clarification, or a simple example, is due
for explaining how a failure can occur when the count is nowhere near
the global max.

5.4.2: "it is worthwhile looking for algorithms with better read-side
performance" - should it not be "write-side performance"?

--Elad
