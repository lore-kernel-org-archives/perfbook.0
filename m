Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=E71zXOo85rj66f0+PWvGJ00E4gzeQM9EVV+LdXIr/f0=;
 b=jkSR1CMH1WRfbGuk7AszXsGRjOdIs2VjWqu4LhCpZpJZWax6eIlf1NbM4e5hu99VOG
 zndM7AtWMN8E+hNMAXoGp7obMpOZKfEVKBf4mwrDRzMs0yWBbSHVn8/WgxMn5lFr6K98
 Rsyc8mVNACUoKATRG6Uc0zDQVF/gr9QU2gcaLuPtWN2eJ5IJdOwphREf7oR05Fp2h5nf
 gOxH4bJS1dnEr95hOYtEFNnUsjNxODVqO+baIk2DCOTaFkVpbl46QySffBY6Qf454hwH
 EnXCdctNw0nVkmw9RzFp4XXv+iwxHUvLTaSc8SLkRvVIFxO8AGwfO+uySAgPF3MhPR2M
 ytBw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/6] advsync: Misc. fixes around litmus tests
Message-ID: <1dd8bb1c-ce48-1de0-0032-fdab3bd68b46@gmail.com>
Date: Thu, 13 Jul 2017 00:07:18 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From de45acd5a73354cbe03abaf3130177687c77e4cb Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 12 Jul 2017 23:45:17 +0900
Subject: [PATCH 0/6] advsync: Misc. fixes around litmus tests

Hi Paul,

This patch set tries to cleanup recently updated material in advsync.

Patches 1 to 3 are fixes of litmus tests under CodeSamples/advsync/herd
and their corresponding snippets in memorybarriers.tex.

Patch 4 is trivial fixes.

Patch 5 is my attempt for the sentence to make sense.

Patch 6 updates the usage of x0 and x1 in the tables of Store-Buffering
Sequence of Events. I stopped short of using READ_ONCE() and WRITE_ONCE()
in the "Instruction" columns. The change seems unnecessary for me.
I think we can assume a reader of this section can easily translate
READ_ONCE() and WRITE_ONCE() to simple assignments in his/her mind.
Also, you are calling x0 and x1 as if they are variables in the text.
But I don't think the current way of description is ambiguous.

So, Patches 1 to 4 should be all right. You might feel otherwise to
Patches 5 and 6.

Thoughts?

            Thanks, Akira
-- 
Akira Yokosawa (6):
  advsync: Fix typo of litmus name
  advsync: Fix typos in load-buffering litmus tests
  advsync: Fix remaining typo in exists condition
  advsync: Trivial typo fixes
  advsync: Fix grammatical error
  advsync: Adjust value expressions in Tables 14.1 and 14.2

 CodeSamples/advsync/herd/C-LB+o-o+o-o.litmus       |   2 +-
 CodeSamples/advsync/herd/C-LB+o-r+a-o.litmus       |   4 +-
 .../advsync/herd/C-MP+o-wmb-o+o-rmb-o.litmus       |   2 +-
 advsync/memorybarriers.tex                         | 103 ++++++++++-----------
 4 files changed, 55 insertions(+), 56 deletions(-)

-- 
2.7.4

