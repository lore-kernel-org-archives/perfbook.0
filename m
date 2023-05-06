Return-Path: <SRS0=3PTh=A3=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683388359; x=1685980359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EQeGhnRn7xWgIixZKaYXkQdHWiFHzo1JZ1sqsjKROJI=;
        b=ZEh/cQRt+C/nGX5EVGz1f/vvjFwTk0S476JTt8JUhv7sY5cYsidpgGUhoJp7EA1mJ0
         hUn1UZ2TDxyNKUCaZ280qS1hzNNdGHddCqdcc6E/5nwMq30W7Hn940OopTnuOBYiSnTn
         ip/kPtrE3QRaQ1kFfqiIas6Yjyj63UEVUkwXv1uaBh4NvW/Mqx6CBpc6DiOM6hdLVEj9
         Z7Ei/HB7AkPanqwM+ukRQHxenNScg+xuUtT/6iwRBAkP4BYyB+5lM0HAHCQulOEZSPcB
         /XoukKfhZrq2+FAnHvE8wSyqlyKn3gQvhMyW97AwDTS8jccdKvg7UhoXyB16/6+4LwOd
         +vWw==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH] datastruct: Make the figure consistent with the page
Date: Sat,  6 May 2023 15:52:31 +0000
Message-Id: <20230506155231.29673-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The referenced figure is currently inconsistent with the page.
Fix that.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 datastruct/datastruct.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 82affce0..8c2bfc16 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -827,7 +827,7 @@ to about half again faster than that of either QSBR or RCU\@.
 }\QuickQuizEnd
 
 What if the memory footprint is reduced still further?
-\Cref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR}
+\Cref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR With Non-Initial rcu-head}
 on \cpageref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR With Non-Initial rcu-head}
 shows that RCU attains very nearly ideal performance on the much smaller
 data structure represented by the pre-BSD routing table.
-- 
2.34.1

