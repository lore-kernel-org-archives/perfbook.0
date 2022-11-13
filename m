Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232676AbiKMP0P (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 13 Nov 2022 10:26:15 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9299FF0
        for <perfbook@vger.kernel.org>; Sun, 13 Nov 2022 07:26:14 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id i21so13914631edj.10
        for <perfbook@vger.kernel.org>; Sun, 13 Nov 2022 07:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HtKz3hTCNDHZ78OWwvRVCg2Ta883U2CTpKbwpNjQHpk=;
        b=eIqye8ork35h2DcoNnMgaHWHzKORdR6NrBrhEz0tYIY91uBj3tlsw95N0SnZEGETQb
         ueKy1gHTv+5hVPN1ONqbN1sIbPnQGDiUyMDbkvJBBOUNL/Z5ERseaWOnY6XpePksUu6m
         /nUUpdL3nHBhqnn11p9pYXvdX1DGjjnHJhpeL6Ify5qTLRB/OQZ0+KVvX3vsoG99ujrH
         KsrbIo4TpnQsoa7TNmu+u62ZyKCcUY52dRjwIewymJVl99fIXBOs7pZpaY42f4ue0mDc
         EjoWwBfbh+BOSCP1qxI5FMmOj0mU+bINc3SUYTsiSLzxn7G5jHVUcyAgMqHqnto1oCu7
         adrg==
MIME-Version: 1.0
From: Elad Lahav <e2lahav@gmail.com>
Date: Sun, 13 Nov 2022 10:26:00 -0500
Message-ID: <CAJbg=FUGD01BGGiO_t5vSz8kQi0-Kp2GmqEZ7HN4nLmQFVSM1A@mail.gmail.com>
Subject: route_hazard no longer builds
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Trying to build route_hazard on Ubuntu 22.04, GCC 11.3:

cc -g -O3 -Wall -o route_hazptr route_hazptr.c hazptr.c
../lib/random.c -lpthread
/usr/bin/ld: /tmp/ccK5WldD.o:/home/elahav/src/other/perfbook/CodeSamples/de=
fer/hazptr.h:55:
multiple definition of `HP';
/tmp/ccWgXBZR.o:/home/elahav/src/other/perfbook/CodeSamples/defer/hazptr.h:=
55:
first defined here
/usr/bin/ld: /tmp/ccK5WldD.o:/home/elahav/src/other/perfbook/CodeSamples/de=
fer/../api.h:294:
multiple definition of `thread_id_key';
/tmp/ccWgXBZR.o:/home/elahav/src/other/perfbook/CodeSamples/defer/../api.h:=
294:
first defined here
/usr/bin/ld: /tmp/ccK5WldD.o:/home/elahav/src/other/perfbook/CodeSamples/de=
fer/../api.h:278:
multiple definition of `__thread_id_map';
/tmp/ccWgXBZR.o:/home/elahav/src/other/perfbook/CodeSamples/defer/../api.h:=
278:
first defined here
/usr/bin/ld: /tmp/ccK5WldD.o:/home/elahav/src/other/perfbook/CodeSamples/de=
fer/../api.h:279:
multiple definition of `__thread_id_map_mutex';
/tmp/ccWgXBZR.o:/home/elahav/src/other/perfbook/CodeSamples/defer/../api.h:=
279:
first defined here
/usr/bin/ld: /tmp/ccK5WldD.o:/home/elahav/src/other/perfbook/CodeSamples/de=
fer/../api.h:485:
multiple definition of `__per_thread_smp_processor_id';
/tmp/ccWgXBZR.o:/home/elahav/src/other/perfbook/CodeSamples/defer/../api.h:=
485:
first defined here
collect2: error: ld returned 1 exit status
make: *** [Makefile:129: route_hazptr] Error 1

Both route_hazptr.c and hazptr.c include api.h, which defines (not
just declares) a few global variables. I'm a bit surprised this worked
in the past. Perhaps there should be an api static library against
which all examples build?

Also, when trying to fix this I noticed that
DECLARE_PER_THREAD/DEFINE_PER_THREAD cannot work in conjunction, as
GCC seems to treat the following as unrelated:

extern struct { int a; } foo;
struct { int a; } foo;

$ gcc -Wall -c test.c
test.c:2:19: error: conflicting types for =E2=80=98foo=E2=80=99; have =E2=
=80=98struct <anonymous>=E2=80=99
    2 | struct { int a; } foo;
      |                   ^~~
test.c:1:26: note: previous declaration of =E2=80=98foo=E2=80=99 with type =
=E2=80=98struct <anonymous>=E2=80=99
    1 | extern struct { int a; } foo;
      |
