Return-Path: <SRS0=l0fT=J6=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vGDPiD3BIMDhf8xgF5fK0GtJpvnikWzXd684ascF7W4=;
        b=APfJ+0e9yFYx0GvcVx29wSQrfHzpCUbOhDI0j+vEZGdaU4MZ7xsGemXq/3sBRQQHff
         WfyQVRukdVWVs//T8KDnyvcttW49jIpHFN/CCcKc9rCu9npFBSuqQ45+uUCQEp0pCavJ
         gEjp8lur+dHmCxFkcGqezGqk+0GXlc4L5Yf7x01h4FYKbZB6lU8Tbr6cp00orlk2YNPY
         hiC0UubJZnP4XIqGQPZ/6t4L7Pxu3iBe3m78nfOXMUNEtdGkYZ4GqKZmc14W7aJi5yoP
         xnldD93cnKmRi/Tlxc21IQW4L4nrDb5xA0XTpo4d/FEhNkNFJQXHPoG1RVcWUOVy7jmi
         DKhA==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH -perfbook] Fix the description of rcu_gp_ongoing
Date: Mon,  3 May 2021 20:15:54 +0800
Message-Id: <20210503121554.4520-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, luyang.co@gmail.com, perfbook@vger.kernel.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I am going to revise Chinese Edition of Appendix with
Yang Lu's unreserved help.

During the process of reading, I examined the definition of
rcu_gp_ongoing in CodeSamples/defer/rcu_nest.h
Would it better to describe rcu_gp_ongoing in the book as:
'it checks the set of bits indicated by RCU_GP_CTR_NEST_MASK.' because
I think 'it checks the bit indicated by RCU_GP_CTR_BOTTOM_BIT'
is a little confusing.


Thanks alot
Zhouyi Zhou

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
 appendix/toyrcu/toyrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 8fd2aef0..830e4478 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -1215,7 +1215,7 @@ adds \co{RCU_GP_CTR_BOTTOM_BIT} to the global \co{rcu_gp_ctr}
 instead of adding the constant ``2'',
 and the second is that the comparison on \clnref{ongoing}
 has been abstracted out to a separate function,
-where it checks the bit indicated by \co{RCU_GP_CTR_BOTTOM_BIT}
+where it checks the set of bits indicated by \co{RCU_GP_CTR_NEST_MASK}
 instead of unconditionally checking the low-order bit.
 \end{fcvref}
 
-- 
2.25.1

