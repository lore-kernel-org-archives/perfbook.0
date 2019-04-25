Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4OZe5JoNXdJzv/cOLq+HOBLFQ0/J+EPCK8InkD7rQaQ=;
        b=EvMOJEAGINTpxtC9bNgqMtkfGUN1f5N2s/rc8sp8Ctc7Ru8oG09twzOEEInVU5OdtQ
         5yDtpZwyKCjAexXamueqbMAfjb4bEuxAIxtlNTD0KCipdo6PSQ3HeG/jMeLvu8on8oM2
         pOIJeg0VmlgPqmUzsIOYf3xQtIJEhHZVGq9TT0iNQ0CSIeNX40Vz2vdDTnB7OgK0nC8F
         L/3ia32E5qbKMYRvH25o3S+pCm0PUS+Y7SzD/KTBMKWo6McwhIWTj/O4qmtSK3kBMdN1
         I4H61AvikKuG8Q5WeYSF0J1+mpdjcs8OHryHQwSwhsc0kQ6SvNyFyjrOhTFoTIFJ9kix
         EuoA==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH v2 2/3] rcu_nest: Use READ_ONCE() and WRITE_ONCE() for shared variable rcu_gp_ctr
Date: Thu, 25 Apr 2019 16:29:53 +0800
Message-Id: <1556180994-16131-3-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1556180994-16131-1-git-send-email-junchangwang@gmail.com>
References: <1556180994-16131-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.ibm.com, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/rcu_nest.c | 2 +-
 CodeSamples/defer/rcu_nest.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/defer/rcu_nest.c b/CodeSamples/defer/rcu_nest.c
index 64e4087..733b01a 100644
--- a/CodeSamples/defer/rcu_nest.c
+++ b/CodeSamples/defer/rcu_nest.c
@@ -35,7 +35,7 @@ void synchronize_rcu(void)
 
 	/* Advance to a new grace-period number, enforce ordering. */
 
-	rcu_gp_ctr += RCU_GP_CTR_BOTTOM_BIT;
+	WRITE_ONCE(rcu_gp_ctr, rcu_gp_ctr + RCU_GP_CTR_BOTTOM_BIT);
 	smp_mb();
 
 	/*
diff --git a/CodeSamples/defer/rcu_nest.h b/CodeSamples/defer/rcu_nest.h
index bcc4cde..64d9679 100644
--- a/CodeSamples/defer/rcu_nest.h
+++ b/CodeSamples/defer/rcu_nest.h
@@ -52,7 +52,7 @@ static void rcu_read_lock(void)
 retry:
 	tmp = *rrgp;
 	if ((tmp & RCU_GP_CTR_NEST_MASK) == 0)
-		tmp = rcu_gp_ctr;
+		tmp = READ_ONCE(rcu_gp_ctr);
 	tmp++;
 	*rrgp = tmp;
 	smp_mb();
-- 
2.7.4

