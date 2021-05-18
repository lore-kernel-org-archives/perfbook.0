Return-Path: <SRS0=v+bS=KN=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2f5XFP0sFacO1ZlNB8ECkBRaH1XyEJWOUn+TWQOqgKg=;
        b=lcV7JUffL8z7OqUTJnt+jZjmGBRGwBZxVtTZd3UiRWmZpiuaDgjfWAPrwvMflX1FvZ
         sqJNKlrCLISP4K2uOFIPpYDKKeGyPsC3zDU49Fv7EuqPdIH0o7NMMAtoSz5fGlu/Fg4b
         4xpY5cKQ01MNDlm9gYDz+JGx89udoKPkeLbMDBxX/1FX8y5+60HfLcIdgaTF7yWiq8MN
         4FIRqyMiwZNZUO0aSRFIS5AMs2KqSUxnlmONa3UbrLt1KNvj5ec5C3lHszh/2h7itZCs
         PcH/V6B/kgvE12xk7v1g7q98WuVJGZecdr73hcnF5UNu8UV3ReL5x1lO3T3CcIrr8Grl
         Ymvw==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH] RFC: possible fixing a preposition 
Date: Wed, 19 May 2021 00:12:44 +0800
Message-Id: <20210518161244.7340-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, luyang.co@gmail.com, perfbook@vger.kernel.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

hi, Paul

In appendix B.7: "Lines 3 and 4 simply add one to
 the global free-running rcu_gp_ctr variable"

I looked up webster online dictionary
https://www.merriam-webster.com/dictionary/add%20to
it says "Definition of add to" is "to make (something) larger, 
better, or greater"
meanwhile rcu_gp_ctr is not changed in this statement.

My native language is not English, I try to search the web
for an example, and I think if replace 'to' with 'and' maybe a
better choice.

Maybe my proposal is not necessary.

Thanks for your time.

Best Wishes
Zhouyi
---
 appendix/toyrcu/toyrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index be77c045..dd759ba7 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -976,7 +976,7 @@ The resulting \co{rcu_read_lock()} implementation is extremely
 straightforward.
 \begin{fcvref}[ln:defer:rcu:read_lock_unlock:lock]
 \Clnref{gp1,gp2} simply
-add one to the global free-running \co{rcu_gp_ctr}
+add one and the global free-running \co{rcu_gp_ctr}
 variable and stores the resulting odd-numbered value into the
 \co{rcu_reader_gp} per-thread variable.
 \Clnref{mb} executes a memory barrier to prevent the content of the
-- 
2.25.1

