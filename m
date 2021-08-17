Return-Path: <SRS0=sDSD=NI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B9GtIJl5PJF6AffIk9TSP0ec6pNVmQ9FCsc6wsjpP+0=;
        b=U9H1FWkZZkVD9l0onsuG9GBnLs4oEKpk9ZbpNCwO7nqN8Sa2a5CYFQp0E27oRZa3kN
         id6VkPfO0/45L3hzjlhFpl4vWa11izKrl09AbkSK3ZJxN2MSb643MlrVG7RjJch+HHTz
         V8zGirFyLXpZzaU3ezZCLBZjIo41tAY4a103t8+G44ASMBjBuwjjzYa2Wclhb/UKE/dd
         Z8r+0q2OIekmdNvqaIq+CI/au/TfQTNTt89P3KJCY09vZrxj/tynNUvVD0U+DV2EKuPs
         wgIRp/QQdqOLIGa+tcNPGTrzJbCkdsyZuJfVxh6Bd13vCXFYTMnZBEI590DjME4SPotQ
         nrLA==
Subject: [PATCH -perfbook 05/11] datastruct: Use \tco{} inside inline
 enumerate list
References: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5a2e3e04-1562-b2ff-8b58-b10af3ba2635@gmail.com>
Date: Tue, 17 Aug 2021 19:23:38 +0900
MIME-Version: 1.0
In-Reply-To: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Inline enumerate lists (enumerate*) are confused by \co{} commands
which have breakable symbols in their argument.
\tco{} is a workaround in this case (as is the case in tabular
cells).

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 datastruct/datastruct.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 6363ef33..adb102d4 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -2077,8 +2077,8 @@ highly replicated.
 It is instead the \co{ht_bucket} structures we should focus on.
 There are two major opportunities for shrinking the \co{ht_bucket} structure:
 \begin{enumerate*}[(1)]
-\item Placing the \co{->htb_lock} field in a low-order bit of one of the
-\co{->htb_head} pointers and
+\item Placing the \tco{->htb_lock} field in a low-order bit of one of the
+\tco{->htb_head} pointers and
 \item Reducing the number of pointers required.
 \end{enumerate*}
 
-- 
2.17.1


