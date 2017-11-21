Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:43632 "EHLO
 mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751187AbdKUPeL (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 21
 Nov 2017 10:34:11 -0500
Received: by mail-pg0-f65.google.com with SMTP id r12so10414455pgu.10 for
 <perfbook@vger.kernel.org>; Tue, 21 Nov 2017 07:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=uGqtkmPg8yicT0RNHmf/ccDyUah+1XzyQkYGnfWy9zw=;
 b=Sm5qBjA+8mfXgVwS6Un37MoXFMbKY0e38yqwDISr3spR573mmMG89W8CI0kd+ag4NE
 6GlDPqYjb4E9afuSxU0MJE/FZ/QSKPj7x4xU9/+YL59lLBfkSRPjefFEp9OnOxDR3CPs
 UwYbnowCjo6iUfcGC+kmC6yDZ/07LHcHMZrHFoWMgoRCh3FM2iM7YXBKaz5QOIHXKsmi
 w4hHej5ewZ0hoPWsb9OXsdP9/+OK02a9P19fsCqgPjcq/m5eZXCQKeD/3Ipb/uha8Ogd
 d65j1i8IRrIo2UdKmXV7hRrI2aWDbitw7Remtzb7exiWZ+uCh+eYvo9zcAZqLzt92RQx
 +w8Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] Add Makefile in CodeSamples/formal/herd
Message-ID: <eb163ed9-ab88-6227-30ab-a985ababfc69@gmail.com>
Date: Wed, 22 Nov 2017 00:34:08 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From 180abe9a72d4e3fbe200ce2a032a6c616a70ce03 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 22 Nov 2017 00:04:40 +0900
Subject: [PATCH 0/2] Add Makefile in CodeSamples/formal/herd

(Resending with To: Paul)
Hi Paul,

This is my attempt to add Makefile in CodeSamples/formal/herd.
The recipes here assumes that the memory-model's repository resides
beside the perfbook's repository on your machine.

The targets include conversion of litmus7 compatible tests under
litmus/ directory to herd7/klitmus7 compatible ones,
running converted litmus tests by herd7,
running herd7 benchmark tests by herd7,
and preparing directory for klitmus7 cross-compile of converted
tests.

Currently, there is no test other than benchmarks under herd/
directory which is not compatible with litmus7. When such tests
are added there, the Makefile can be updated to run and cross-compile
them along with the converted tests.

Patch #1 adds the Makefile and a helper script.

Patch #2 is a fix of compiler warnings revealed in klitmus7 cross-
compiling.
These C-WWC-o+o-* litmus tests were modified by me in this August.
That looked sufficient for litmus7, but definitions in kernel header
files used in klitmus7 aren't satisfied. The change here is the result
of some try-and-errors. There can be smarter way to describe these tests.
They are not used in the text at the moment, so their fix is not
urgent, I suppose.

        Thanks, Akira
--
Akira Yokosawa (2):
  CodeSamples/formal/herd: Add Makefile and utility script
  CodeSamples/formal/litmus: Fix type of 2:r2 in C-WWC+o+o-*.litmus test

 CodeSamples/formal/herd/.gitignore                 |  4 ++
 CodeSamples/formal/herd/Makefile                   | 60 ++++++++++++++++++++++
 CodeSamples/formal/herd/litmus2herd.sh             | 20 ++++++++
 .../formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus |  9 ++--
 .../formal/litmus/C-WWC+o+o-r+o-addr-o.litmus      |  9 ++--
 5 files changed, 92 insertions(+), 10 deletions(-)
 create mode 100644 CodeSamples/formal/herd/.gitignore
 create mode 100644 CodeSamples/formal/herd/Makefile
 create mode 100644 CodeSamples/formal/herd/litmus2herd.sh

-- 
2.7.4

