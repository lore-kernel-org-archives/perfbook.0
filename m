Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=IiUskLBJMKIlldvysL7SFV/tSlcgK/KHikos8/9jhBU=;
 b=dxsO6useyFj5LFOzOu3YxHk5An7bMnAN3qHSFPF4h5gIYgQma8Xj24rJAwwwCkhbI/
 wIrSu3FABLo079rgs2GdaDK2l4d4cR89B1Q3litPaSeLYnJnpJDY+dZHIeuh66E0hTnw
 V1Uksm+6c2NkJWAv7EKXsPEFqoTjxFMO3prybAyudgPwrQbG2EVZjtUMoX3DBjHNiFX5
 4+otim73l75rlJE/16n1Ty3lsl+N8tssjfLjgBrj7W+/Hofgj1yo4cYvFbABaHUzNZ6C
 W2qHZoRHYIGRe/FcLPfWjhTaWn0FmtI3A5nVUWIqFharuDSJbXXSSKusVIIvh6kiiE/3
 TtWw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 00/13] Remove \co{} commands in tables
Message-ID: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
Date: Wed, 4 Jan 2017 10:15:40 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d07bf0df57c597c22de9a7c159f10b0247cea8c2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 4 Jan 2017 08:51:15 +0900
Subject: [PATCH 00/13] Remove \co{} commands in tables

\co{} command confuses column width estimation of tabular environment.
By removing \co{} commands in tables, bogus "~"s for manual width
adjustment can be removed.

Patch 1 introduces an alternative command \tco{} to be used in tables.
Patches 2--8 remove \co{} commands by using \tco{} or removing unnecessary
commands.
Patch 9 removes another "~" and uses \vspace{} instead.
Patches 10--13 do additional font tweaks. It looks better for me if
headers of tables such as "Thread 1" and "CPU 1" are typeset in normal font
of the text (Times Roman). Patch 13, which tweaks font of non-code words in
table, may be an excessive tweak. Whether or not to apply it is up to the
editor.

--
Akira Yokosawa (13):
  Define \tco{} command to be used in table
  rcufundamental: Rewrite table 'RCU Publish and Subscribe Primitives'
  rcuapi: Rewrite table 'RCU Wait-to-Finish APIs'
  rcuapi: Rewrite table 'RCU Publish-Subscribe and Version Maintenance
    APIs'
  whichtochoose: Rewrite table 'Which Deferred Technique to Choose?'
  memorybarriers: Remove \co{} in tabular env
  memorybarriers: Use \verb in table 'Lock-Based Critical Sections'
  whymemorybarriers: Remove \co{} in tabular env
  memorybarriers: Replace nbsp with \vspace
  Add \nf{} command to go back to normal font
  memorybarriers: Add \nf{} command to table header
  whymemorybarriers: Add \nf{} command to table header
  memorybarriers: Add \nf{} command to descriptive words in table

 advsync/memorybarriers.tex           | 187 +++++++++++++++++------------------
 appendix/whymb/whymemorybarriers.tex |  70 ++++++-------
 defer/rcuapi.tex                     | 110 +++++++++------------
 defer/rcufundamental.tex             |  18 ++--
 defer/whichtochoose.tex              |  20 ++--
 perfbook.tex                         |   6 +-
 6 files changed, 200 insertions(+), 211 deletions(-)

-- 
2.7.4

