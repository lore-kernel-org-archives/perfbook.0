Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XTjBkNl0CZbOEnriWK+cenMMgwITsLC26nUzzc4ZnGM=;
 b=l2PRwhI0sOZPsi9s02ja6tLX9rTt2Swi6/F/tgz5dnxfWNPE4z/4osndt2EHfkRi5S
 Rfq496g4byMaVzzQQ+sjlR3CXsO1cHE9PAM7w+KuQ4eGKcIJR/YDNmRe7Wt2inKXQhhK
 jEmCeUM5GRhzbhTb/XDmwjUk7FrguhdKJJSo3dVYXIngeqoqAz7Vm2mrnxER8ltOJxcI
 eWmEwbXu/9U/fY6loPYXNVxwIto+Bx8O75FbwNkWKrBkgXnX6sDNreSBxuH1TCACb48v
 R9QHK6UfPmsL9IzbNunoedhUgR78ZqdIBm84jjnNqhDa7xQEVNmMMNFCBjLoQ/b6gqkR
 0J8g==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 5/8] together: Append `()` suffix to function name quotation
Date: Tue, 11 Oct 2016 08:07:35 +0900
Message-Id: <20161010230738.14452-6-sj38.park@gmail.com>
In-Reply-To: <20161010230738.14452-1-sj38.park@gmail.com>
References: <20161010230738.14452-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 together/applyrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 659928877c00..86471633a64a 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -268,7 +268,7 @@ Line~65 then retains a pointer to the current (soon to be old)
 \co{countarray} structure, and line~66 uses \co{rcu_assign_pointer()}
 to install the new version of the \co{countarray} structure.
 Line~68 waits for a grace period to elapse, so that any threads that
-might be concurrently executing in \co{read_count}, and thus might
+might be concurrently executing in \co{read_count()}, and thus might
 have references to the old \co{countarray} structure, will be allowed
 to exit their RCU read-side critical sections, thus dropping any such
 references.
-- 
2.10.0

