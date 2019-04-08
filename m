Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LD8iNVqGFqfUPJlgu/EwQmTgSJ8yV9zQlRsomZtXRuY=;
        b=R5g20YkY7cYNZBPQNny+SxDaET8boffqggeeV2e00Y/OokYu565TjFpOZU1CbczIRg
         b4QRXlMoc43OEHbNWbBQnQ7Fgh5n5HkQbTL7mZosMuBcJjDyTeQQcZu9swJmE9D7HW5n
         SgrQcIZx/+hUkYtAEHSqzgBPLP50z4SmUCdJf/ZOPmcC4VSZY1mdKhYjZV2wl6jka++y
         vT0VTO6shAai3WYa4tKZBJkU7+RhPXoSahL6BaqddV3/eZmXiDopGuJUIqsp2xk6dPoK
         PjAF2xoPZKI5VkoSvDRmO7r00SNkPaXOiv5mFctLkJ91TYCFhy0YTvPjN6qiD15Xvpui
         LLzw==
Subject: [PATCH 2/3] RCU.bib: Add entries of git commits of dyntickrcu fixes
References: <1b15d6d0-55da-0fc6-67bb-0f30b4eb5fa9@gmail.com>
 <36421da6-4c59-597a-660f-f7ddf1d8835c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5fd595c5-fc1d-757f-76e8-b38fee44f9d1@gmail.com>
Date: Tue, 9 Apr 2019 00:47:50 +0900
MIME-Version: 1.0
In-Reply-To: <36421da6-4c59-597a-660f-f7ddf1d8835c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From eca275e44ff447bdbd397411f363d816bcab25a4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 9 Apr 2019 00:06:53 +0900
Subject: [PATCH 2/3] RCU.bib: Add entries of git commits of dyntickrcu fixes

These are to be cited in formal/dyntickrcu.tex.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/RCU.bib | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index 7f0204f7..073b89ef 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -3063,3 +3063,25 @@ Read-Copy-Update {(RCU)}"
 ,year="2019"
 ,note="\url{https://lkml.org/lkml/2019/2/27/829}"
 }
+
+@unpublished{PaulEMcKenney2008commit:d7c0651390b6
+,Author="Paul E. McKenney"
+,Title="rcu: fix \co{rcu_try_flip_waitack_needed()} to prevent grace-period stall"
+,month="May"
+,day="12"
+,year="2008"
+,note="Git commit:
+\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d7c0651390b6}"
+,lastchecked="April 6, 2019"
+}
+
+@unpublished{PaulEMcKenney2008commit:ae66be9b71b1
+,Author="Paul E. McKenney"
+,Title="rcu: fix misplaced \co{mb()} in \co{rcu_enter/exit_nohz()}"
+,month="March"
+,day="19"
+,year="2008"
+,note="Git commit:
+\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ae66be9b71b1}"
+,lastchecked="April 6, 2019"
+}
\ No newline at end of file
-- 
2.17.1


