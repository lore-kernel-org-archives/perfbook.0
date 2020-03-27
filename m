Return-Path: <SRS0=2js+=5M=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=3KuX6HxQECkfWduUQ5/BOm41mWG5UCfNy6AiB9NFIHE=;
        b=AD8Pl/8Wn12p3hVelhS6ASGxk7NUsSvL/pZ2BzEni1BCFviOMTZ5BEwllQlRyf8o9Y
         jSCbsfWekFex6btoKS+KLGu4RfqB1fkjCE2UEjg6XrIh33iriImfcJft0iV9uiHrKKdJ
         +5P9R48tgEv9cDHroREJN+FkGnqtJG8Ea7jVwF735GYFTp0gDbpQILwLOvMaYbzSkWs2
         +R9BPSQZf6x7VMGrItPRNeoPgNdoV25AWcSps3XiW8yIPjjRRlk/NbA2B8NjJR+Y+t08
         Cdlx89yEbIxwUqmaHadFwWJ1fqRGc3Krfs0KiW7gA9ZK3sbk9Sci4TWngP0la2Gn3pOo
         dh1A==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/4] Misc updates and fixes including 'make help' improvement
Message-ID: <58f67d0a-cd08-387c-bd69-5c53c8049c4a@gmail.com>
Date: Fri, 27 Mar 2020 20:20:20 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is a set of misc patches.

Patch 1/4 adds an entry in FAQ-BUILD on an issue of Fedora 31.

Patch 2/4 fixes the paper size issue in -hb build using the
"geometry" package.  At least we now know how to add a custom paper
size without modifying book.cls.
The tweaks of margins look somewhat ad hoc, and they are the result
of a few tries and errors on my side.

Patch 3/4 is a trivial typo fix.

Patch 4/4 is the update of "make help" you suggested yesterday.

        Thanks, Akira
--
Akira Yokosawa (4):
  FAQ-BUILD: Add entry on recent breakage in texlive update on F31
  Fix paper size of -hb build
  toolsoftrade: Fix trivial typo (api-pthreads.h)
  Makefile: Show only official targets in 'make help'

 FAQ-BUILD.txt                 | 16 +++++++++++++++-
 Makefile                      | 24 +++++++++++++++---------
 perfbook.tex                  | 12 +++++++++---
 pfbook.cls                    |  9 ++-------
 toolsoftrade/toolsoftrade.tex |  2 +-
 5 files changed, 42 insertions(+), 21 deletions(-)

-- 
2.17.1

