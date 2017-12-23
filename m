Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:36496 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757161AbdLWDmI (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 22 Dec 2017 22:42:08 -0500
Received: by mail-pg0-f68.google.com with SMTP id k134so15173103pga.3
        for <perfbook@vger.kernel.org>; Fri, 22 Dec 2017 19:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=WZ0WeT652Y5fFMwjparHwM2FzbHF8ZXQ7Bok4MoLF0M=;
        b=HqtrKaDEVCmFauI1OybBac24KIxi9cUJE3Biilhd+jrgibZOubT0IBEJdbT9nV/TzQ
         L+brUShN01j+bAx70ZDfI3HBIEJg1h0rQ01IP43HLA3TglK9PxYJhMK/5sztwbx52eYI
         vUCA+bk2YqVvaOR14sYcOabr98uR7UU0Zf76p+sAJmYkzv0jCD6K4adlLagZn/EjvWHv
         R1ROYoIWONiedV5UnijSuo1LvDLXcK3K0L6SI6tEpbHoQ0NBIZgzdATew1R6dB/VeSkr
         QXNLMD9uJ6FqzY/TDgOcnjabr4qZicO6Vz8pQ+xYddDdR4xASTBHNNLrpQf7vwc5+1h2
         Lmxg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/4] count: Get rid of ACCESS_ONCE
Message-ID: <8134b352-67cd-2426-a3f7-ca776a3d7267@gmail.com>
Date: Sat, 23 Dec 2017 12:42:04 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

Hi Paul,

This patch set removes ACCESS_ONCE() in Chapter 5.
(Yes, I saw the update in todo.txt.)

Patch #1 updates code snippets and code under CodeSamples/count/.
Patch #2 updates text in Chapter 5 as well as Section 4.2.5 to adjust
context.  Citations in QQA to LWN article "ACCESS_ONCE()" is
replaced by footnotes referencing definition in Section 4.2.5.
Patch #3 adds a couple of git commits to bibliography to be cited
by Patch #4.
Patch #4 adds a Quick Quiz in Section 4.2.5 to put a brief history of
ACCESS_ONCE().

As ACCESS_ONCE() has been removed during Linux 4.15 merge window,
it would be a good chance to put some memorial words in perfbook.
In patch #4, I put them in a QQA. An alternative would be to
put them in a dedicated section on "compiler barriers" in Section 4.2 or 4.3.

In any case, the wording of the brief history needs some polishing
by the inventor of ACCESS_ONCE(). So I don't expect patch #4 to be
applied as is.

BTW, I thought twice about citing the git commit adding ACCESS_ONCE()
in RCU code because of its title. Are you OK with it being listed in
bibliography?

      Thanks, Akira
--
Akira Yokosawa (4):
  count: Get rid of ACCESS_ONCE() in code snippet
  count: Get rid of ACCESS_ONCE() in text
  Update bibliography
  toolsoftrade: Add quick quiz on ACCESS_ONCE()

 CodeSamples/count/count_lim_sig.c | 26 ++++++++++-----------
 CodeSamples/count/counttorture.h  |  8 +++----
 CodeSamples/count/limtorture.h    | 18 +++++++-------
 bib/RCU.bib                       | 33 +++++++++++++++++++++++++-
 count/count.tex                   | 45 ++++++++++++++++++++---------------
 toolsoftrade/toolsoftrade.tex     | 49 ++++++++++++++++++++++++++++-----------
 6 files changed, 119 insertions(+), 60 deletions(-)

-- 
2.7.4

