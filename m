Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mail-it1-f174.google.com ([209.85.166.174]:37856 "EHLO
        mail-it1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbfEJLfO (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 10 May 2019 07:35:14 -0400
Received: by mail-it1-f174.google.com with SMTP id l7so8617244ite.2
        for <perfbook@vger.kernel.org>; Fri, 10 May 2019 04:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=I49+/4awst+K32HfnvGzaLYaFH7Kx56NhEMaw9UyfRU=;
        b=cxMEINFyZnRzICYax8OZqDm7rV93z8a9c48bNXnKOTgRo8E1HH7ry042lC5JcZVbEN
         e5tagr7SUBXRb2sk9mvdY5d2CfFoL4ktlnRum49Cfb+MSL+fa4SXRtIZygWqiuQq4RlB
         K0X6uAnr/BoxvVBG8oK4wO6thz9Qn06tqVMWXdYwIO2p+drqUU0Vvb0EZ4PB1c8G4bT9
         XIMui6EjXbUwj18od5vXmxqFsnmf2IfH9S8u4a02IxNkRyZYsWe94wD26BiibfTkaTo4
         kbvQV2+5Uc6iiNARnK4+eDwL41EjAJpvbv5mhGQl9CnGy8kEPZdkOdlKdD62KSm5M/FV
         7YIg==
MIME-Version: 1.0
From: Elad Lahav <e2lahav@gmail.com>
Date: Fri, 10 May 2019 07:35:02 -0400
Message-ID: <CAJbg=FWSV6akb4g7Kt8-sNt-mnLUZ25MHZ=bPQuEfd6PEUY0NQ@mail.gmail.com>
Subject: Single-threaded accesses and signal handlers
Content-Type: text/plain; charset="UTF-8"
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hello,

In a few places in Chapter 4 it is mentioned that a certain access
pattern is safe in a single-threaded program. In many (most?)
Unix-like operating systems signal handlers in an otherwise
single-threaded process execute in the context of that single thread.
Nevertheless the signal handler represents a conceptually separate
stream of execution that is subject to similar race conditions as
those that occur in "true" multi-threaded programs. The situation is
even worse with signal handlers as standard locks typically cannot be
used to protect the access to shared data.
It may be worthwhile to mention this pitfall.

Also, a small typo in "Shared-Variable Shenanigans":

--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1550,7 +1550,7 @@ Of course, where practical, the primitives described in
 Section~\ref{sec:toolsoftrade:Atomic Operations (gcc Classic)}
 or (especially)
 Section~\ref{sec:toolsoftrade:Atomic Operations (C11)}
-should be instead be used to avoid data races, that is, to ensure
+should instead be used to avoid data races, that is, to ensure
 that if there are multiple concurrent accesses to a given
 variable, all of those accesses are loads.

--Elad

