Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=a4+1E4zxOCdxuAtcvM/wo5VKGxoNnfVuLvJVh1EOc/I=;
 b=dyidKlj5PeuCQYUXnnEZU3zNMH48RhaeZdTZVbKN+MaKAJCANZqSiEPZhXNIvu9JXG
 C9moBg+OvVqvrt1+jxoUxrOrkcoFJ6Vgz1EEY7t/APPMKTNsrL3e68LugvRTa5odumAn
 7H+Ro1WichcTyg09alAGgAAVFNqUsMg6pQT3C4ocZ+b0udVIT/Uv5azwImWI55vFO/7i
 6kp/JKltVON3FEUEGmdSRt9LIS5oSLsfl3HB4wWiA9dc9Hev2iXSJALM2q3StJXEPgw4
 U2JEeSgwxMpirbfbQ33cF0c/P/v362cSXIINH394YknO17WO6I2VkseiAJ2nPvFHvgJk
 YuhQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFC PATCH 0/7] Import 'TRANSITIVITY' section
Message-ID: <ef9bafef-1f79-ebb1-18b1-8c0adc695b4b@gmail.com>
Date: Sat, 25 Mar 2017 18:33:55 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 461f7d8b71f955c17ce30585b301834c3ad4026b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 25 Mar 2017 17:54:01 +0900
Subject: [RFC PATCH 0/7] Import 'TRANSITIVITY' section

Hi Paul,

As has been being discussed off the list, I'm attempting to update
"Memory Barriers" section to catch up memory-barriers.txt.

This patch set imports "TRANSITIVITY" section and do some tweaks
for better LaTeX typesetting.

Patch 1 imports the section mostly as is.
Patch 5 diverts from current memory-barriers.txt in the way to
present code snippets.
Patches 2 and 7 are updates for issues in previous sections I noticed
while doing this work.

Although we need further updates, especially to replace "LOCK/UNLOCK"
with "ACQUIRE/RELEASE" to go along with changes in memory-barriers.txt,
this patch set seems worthy on its own.

Thoughts?
                                  Thanks, Akira
--

Akira Yokosawa (7):
  advsync: Import 'TRANSITIVITY' section from memory-barriers.txt
  advsync: Permit p (page) placement for consecutive wide figures
  advsync: Make code snippet in deference to Herman Hollerith float
  advsync: Add footnote on transitivity
  advsync: Make code snippets more asm like
  advsync: Properly use nbsp in initial values
  advsync: Avoid indent after minipage

 advsync/memorybarriers.tex | 207 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 195 insertions(+), 12 deletions(-)

-- 
2.7.4

