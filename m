Return-Path: <SRS0=EXSE=BK=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684685337; x=1687277337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z+CVK1zaORlVtHUEkLHk5Fiz6VoASxLizm/9EDjgid4=;
        b=K/E3z92/uRHDMVWHW2F9Vx7co1B0ctkXP78GZ83ZG1EP0IFyUIvTURByDkqYOpyK60
         /XwQpnbqOM6y7EVyJKs0djijN1AhM+Wreg6kTJigewUl7XJukhAEZeCK8qpWaQ5+s+go
         3Pfu/wQ4LAw2reV6nWhGDHJEnG5ENM7PNUFoLorLN7YZ0hAqFWvGwZBKTT+h7WhWBGfS
         RLZUfRKERE2jI4A7l7ubl0u7w0nV2cnjhmsBidEDgrepqLafM8vDR3eejy31duweUGVZ
         mxS95dAKhhFfaG030aq5yE3Y7735k+LU3ty+7LtvHRCu18Asa9OTHusbKc3KkZjy+9oE
         JUwg==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH] formal: Fix reference
Date: Sun, 21 May 2023 16:08:47 +0000
Message-Id: <20230521160847.2258-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The item cites the wrong reference. This patch fixes that.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 formal/dyntickrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 42c0c55c..2ed31f84 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -1132,7 +1132,7 @@ This effort provided some lessons (re)learned:
 	In this case, the documentation effort located
 	a misplaced memory barrier in
 	\co{rcu_enter_nohz()} and \co{rcu_exit_nohz()},
-	as shown by the following patch~\cite{PaulEMcKenney2008commit:d7c0651390b6}.
+	as shown by the following patch~\cite{PaulEMcKenney2008commit:ae66be9b71b1}.
 
 \begin{VerbatimU}
  static inline void rcu_enter_nohz(void)
-- 
2.34.1

