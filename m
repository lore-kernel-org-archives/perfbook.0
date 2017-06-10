Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vSnDLCcxnFD4G8gXW9kSncQpXsKr/Eeeji0cAofHrGo=;
 b=Pppsah9IrCRV7L9OlkaKXTVFtoR6KV2EY1pe66HJsi4BUOos/oF04PsFakDV6DR/+2
 GFXHXGhK24xUHf1cPPeS65WEAjYJvNTfIVr2VYMcuHndgx3ww2qNQCNUYHJvV2W+DULj
 41aDbx7iW7tAXkZLzU260X7n8Bxq+2cJ+uojBxQTKSLjb+zKE+A7aeyX4AylW59JczC7
 CMZLgw0u/2hcsNjD+fLq/qPacHzLifwbHNtVV034hZwFjrNKjzowkeCTzsD2XIsIXBPQ
 wAMh9MUNZ2UGY5efEaVBSQExLgHqXuLiHltfzbN+/dz/GI6ijt/gyVl66UJR1oj6yVYf
 IxaA==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 1/4] Figure Storage Hazard-Pointer Storage and Erasure: Switch
 from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()
Date: Sat, 10 Jun 2017 22:28:28 +0800
Message-Id: <1497104910-4596-2-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1497104910-4596-1-git-send-email-junchangwang@gmail.com>
References: <1497104910-4596-1-git-send-email-junchangwang@gmail.com>
To: perfbook@vger.kernel.org, paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 defer/hazptr.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index cdde323..10ae7a1 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -26,12 +26,12 @@ may safely be freed.
  2 {
  3   void *tmp;
  4 
- 5   tmp = ACCESS_ONCE(*p);
- 6   ACCESS_ONCE(*hp) = tmp;
+ 5   tmp = READ_ONCE(*p);
+ 6   WRITE_ONCE(*hp, tmp);
  7   smp_mb();
- 8   if (tmp != ACCESS_ONCE(*p) ||
+ 8   if (tmp != READ_ONCE(*p) ||
  9       tmp == HAZPTR_POISON) {
-10     ACCESS_ONCE(*hp) = NULL;
+10     WRITE_ONCE(*hp, NULL);
 11     return 0;
 12   }
 13   return 1;
@@ -40,7 +40,7 @@ may safely be freed.
 16 void hp_erase(void **hp)
 17 {
 18   smp_mb();
-19   ACCESS_ONCE(*hp) = NULL;
+19   WRITE_ONCE(*hp, NULL);
 20   hp_free(hp);
 21 }
 \end{verbbox}
-- 
2.7.4

