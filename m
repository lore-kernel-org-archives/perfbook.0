Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rhS6I8U46+v5eSI3WBCq/0p51mz/kaGqmGYtimQLFFg=;
 b=KhuZyoyNSlI9l5EdODVnWGPO/atZ5m97DayCu+6zcL8D5ZdqIy38gQcAsWqISzaWuD
 e2BnBCchvGV9v15Y2vZFB7d89cVd7Q3ybcFDPW80ReLTfMGJiz0FqdRXQ1TR9onpdDTi
 Du6Pz5kscUTflo6MCsDZT6xT7zjUKRdd2YyqChZNVI9CYoa4Y+0yon21t2YDkOhgH+Kc
 ++trgqGkHCCTppph+goatjK0zUBmwVXpQgayVjz8dsK6A1sEkZJXnwGVRTmwu3lE15cr
 T8jyQVfTLGDXOxeqE0b5h8hHLTfBOPG9B186V+a4I3BxMVjIgsGIxF2tGZbv54rK2PK5
 xlXA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 8/8] together: Improve struct field quotation readability
Date: Tue, 11 Oct 2016 08:07:38 +0900
Message-Id: <20161010230738.14452-9-sj38.park@gmail.com>
In-Reply-To: <20161010230738.14452-1-sj38.park@gmail.com>
References: <20161010230738.14452-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A sentence is not using \co{}, neither -> for quotation of a field in a
struct while other sentences uses both \co{} and -> for such case.  This
commit uses -> and \co{} for the quotation for better readability.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 together/applyrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 02d36e6ba5f3..633488664779 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -262,7 +262,7 @@ Lines~56-60 allocate a new \co{countarray} structure,
 line~61 acquires \co{final_mutex} and line~67 releases it.
 Line~62 copies the contents of the current \co{countarray} into
 the newly allocated version, line~63 adds the exiting thread's \co{counter}
-to new structure's total, and line~64 \co{NULL}s the exiting thread's
+to new structure's \co{->total}, and line~64 \co{NULL}s the exiting thread's
 \co{counterp[]} array element.
 Line~65 then retains a pointer to the current (soon to be old)
 \co{countarray} structure, and line~66 uses \co{rcu_assign_pointer()}
-- 
2.10.0

