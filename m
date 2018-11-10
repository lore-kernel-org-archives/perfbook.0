Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=gNpqzqpHWXcvsLPd2DsxoT4qiQrFN/xOItNzR8HWOoU=;
 b=Z7n/lEw3X0g+/IBu0tJf3wde9pmjJ3A7JinWhjyLAKXAmjtQHl49cF5tr8ODHHm+eX
 I1YpOhXWh4IpSftjITmAfGWe9C+i1bNdDrxv13+5uPjNw2hGxudqCLIhoaqHmT40qReG
 mx3wpp+p7iekw386M3Y+xjSTxm4+4Nb6FqAWuyrC3FfAuEVXQ09G4WwKssnjE9eJMM4o
 M9aK5Z5LaG89hJoN9S4HGZmPyPPwc2iU0J/J+OvIYVjUaTnkeWlszMk2dEFVel+raKn8
 cYIBsE5d90+vEIFNBUhrjBHyMNrr5joYWUiksny8rAEVBrz9DdTH3qhDotN+xG+Efqml
 NJWg==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH] tooloftrade: add missing subject of sentence
Date: Sat, 10 Nov 2018 20:49:58 +0800
Message-Id: <1541854198-4649-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>


Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
Hi Paul,

This is the only patch for Chapter Tools of Trade. Please take a look.


Thanks,
--Junchang

--
 toolsoftrade/toolsoftrade.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 0844b4c..b4bc46a 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -2043,8 +2043,8 @@ machine-sized and properly aligned.
 It can also prevent load fusing, store fusing, invented loads, and
 invented stores.
 However, although it does prevent the compiler from reordering \co{volatile}
-accesses with each other, does nothing to prevent the CPU from reordering
-these accesses.
+accesses with each other, \co{volatile} keyword does nothing to prevent the
+CPU from reordering these accesses.
 Furthermore, it does nothing to prevent either compiler or CPU from
 reordering non-\co{volatile} accesses with each other or with
 \co{volatile} accesses.
-- 
2.7.4

