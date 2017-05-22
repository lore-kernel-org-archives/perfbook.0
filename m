Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=I6Q0iSmmm9+e+aUvtBMiGHxGXLS6b1+o/W3xClbGtmM=;
 b=DrupF9a0zK4f/gfXazIJo21dfCI0aas+sdd96ZQH16IesFKl70O8W4sHNWU/kZe2To
 0aAmRtnEYbUezza21XXZCLK4g48Glk+GHTEY/D6T7PFx17gLV6MEX5xkhExc5cgyk97p
 sqJdlJ9roGQZgKQgvpcgHHOgWnv4IUBxN+/iEWI4Ql8R1b9j5QNLALgGnHpEaga5ubFo
 h01Ou8r8u2bBaoOzpzye27ssXAOiBLdQSiCLgcowvrHASXypx+QD6ulXI1v+T96tZDiY
 2o/Ta/LcYZfDau4C0A5L87WGS88HHXSxTEHGd1Izt5e6BjMwCIhlaJlJ4oeDRmwAqgPk
 NemQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] Update code snippets
Message-ID: <ee37ed49-8952-0e35-1cb8-e9261e274cf3@gmail.com>
Date: Tue, 23 May 2017 00:10:07 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From edbd0adf8aafef3704b9059ae484ee44f2aa308e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 23 May 2017 00:01:27 +0900
Subject: [PATCH 0/2] Update code snippets

Hi Paul,

These are follow-up patches regarding recent updates in
CodeSamples/count/count_stat_eventual.c.

            Thanks, Akira
--
Akira Yokosawa (2):
  toolsoftrade: Update definition of READ_ONCE()
  count: Remove unnecessay smp_mb() in code snippet

 count/count.tex               | 11 +++++------
 toolsoftrade/toolsoftrade.tex |  3 ++-
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.7.4

