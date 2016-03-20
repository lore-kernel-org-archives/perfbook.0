Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3oYclExgnyXJ81GbbRtMhM5FB4qmzfZdawuaAS+1rTQ=;
 b=l4UCTKwgjn+uCodqrKH8uaucqnTa6TQJo8KqniUi/puPlxde5ZynZYA1MD2zAOt6VX
 dbsyxTT46BCutaK9J+IREPyNQA0lPpeDIh+f7ljVK5C28bCb/nLnIhcP+KURYuvp4VwD
 j+eXfiHfzG6Styhm6nkvwQSquwBJShUbuXp9vZJz8YCwVe7uFHOxdQOcYlbjYY1sBQZb
 gARpcOs8FegPlq2gOVjc/BxVjmSzPa/8Y87ggMinc7kCFt6xDKzCpYjx0PhmJGI5lGwj
 JRk1PMJKZF7FWUVGnfDQtEUFzlVy2Mqycci3hanoHUIQOxQ/jOnRWPi+jdUzpAxFsa1F
 eboQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/3] whymb: s/write buffer/store buffer
Date: Sun, 20 Mar 2016 09:24:20 +0900
Message-Id: <1458433461-20936-3-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1458433461-20936-1-git-send-email-sj38.park@gmail.com>
References: <1458433461-20936-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

`Why memory barriers?` appendix uses the term `Store buffer`
consistently.  However, few sentences use another term, `Write buffer`.
Change it to `Store buffer` for consistent term usage.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 8025bec..38ffad6 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -2232,10 +2232,10 @@ thus fully ordering memory operations.

 So, why is {\tt membar \#MemIssue} needed?
 Because a {\tt membar \#StoreLoad} could permit a subsequent
-load to get its value from a write buffer, which would be
+load to get its value from a store buffer, which would be
 disastrous if the write was to an MMIO register that induced side effects
 on the value to be read.
-In contrast, {\tt membar \#MemIssue} would wait until the write buffers
+In contrast, {\tt membar \#MemIssue} would wait until the store buffers
 were flushed before permitting the loads to execute,
 thereby ensuring that the load actually gets its value from the MMIO register.
 Drivers could instead use {\tt membar \#Sync}, but the lighter-weight
-- 
1.9.1

