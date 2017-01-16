Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=9CGqxErj28B4mpF0WiEf8d9prhfeYsweb/SjAYGhu4Q=;
 b=iRPkVHluEQh10d4NGgF3eCGYMvv/01Nw39q+0yKBZOj1YZZjSb5I4i0Lm8mTF4NIH9
 3Lo6uEUW8ilPkvFyiB7L1nmG0LLdnYZM+42r9krzwRqBfjUCoLoOxrtyPygEDi6EfRtw
 9G6hUxasRFUNRmDNQPvqApDM8lBdVF4ky80fsPR5W99ufF/i/NTI0YiCudkjEHmhVBeS
 dsckkcS7lLexjAMX0ZIlKYYqXooQ6c8gk3KxZcx7xWdzMljMBI4y8b63Wz0odqkpAw7U
 hRovIYiS2p2wQmgBTBDt6bkAIxfhs5rMHu6nb9XMXP0er1YfWMf4VAGuuPk8fqW13VJR
 Ojqg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/8] Hyphenation updates
Message-ID: <2c5427c4-463a-d118-3c30-d2c9f7ffd5a7@gmail.com>
Date: Mon, 16 Jan 2017 23:55:18 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4e1157502e94beeef363808e627acd2882e0aac0 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 16 Jan 2017 23:33:49 +0900
Subject: [PATCH 0/8] Hyphenation updates

Hi Paul,

This is a set of fixes and improvements mostly of hyphenation.
Highlight would be patches 3--5, which import hyphenation exceptions
for US English and add some exception for perfbook.
Patch 7 comments out an exception of "process", which prevents hyphenation
of "pro-cess". I think this hyphenation is acceptable, but you may have
other ideas.

                                     Thanks, Akira
--
Akira Yokosawa (8):
  count: Use \log in math mode
  SMPdesign: Add shortcut of extdash to compound words
  Import exceptions for US English hyphenation from 'hyphenex' package
  Add hyphenation exceptions file for perfbook
  perfbook.tex: Include ushyphex.tex and pfhyphex.tex
  Revert "count: Enclose 'REQACK' in \mbox{}"
  Comment out 'process' in hyphenation exceptions
  SMPdesign: Add another shortcut of extdash

 SMPdesign/SMPdesign.tex     |    2 +-
 SMPdesign/partexercises.tex |    2 +-
 count/count.tex             |    6 +-
 perfbook.tex                |    3 +
 pfhyphex.tex                |    4 +
 ushyphex.tex                | 1454 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 1466 insertions(+), 5 deletions(-)
 create mode 100644 pfhyphex.tex
 create mode 100644 ushyphex.tex

-- 
2.7.4

