Return-Path: <SRS0=opCU=SJ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=J6AkeaehbxX0KaY4trdF8A84aIRP3CxiJng/P0Y8nek=;
        b=aCGjwDI9icVnNryBYZ2MQn+cn6b1xmmL0T1P8L4LbVWqWoSaBC9fy5ibEAQN1ebH7z
         J4Hl1ZDMcNQuh+zWGwCbXQ5t0Bpcvnr59yUVZx8KqXRgonj422fuV4NHHC1XX6bwUlvs
         b4zOp7dHBvAlSO3bmRpsv3YT1LTwft5FVp4/9H9BpcrAT5rkoNLGV2TOt7ujA6XJLDAJ
         PrZq5B1EGEZj3wzQqXRPVf/VrTrm9WiM/XuYwzGATx2rXnIM4xhWwS1f+webw9vQ7WZa
         UF5EOneI7Q8ePV+tZNFpUUlTvjLQ+N0pcKTUyJBXL4snuFfZHQY9MND2+R0iW2w4vyAx
         5ISw==
Message-ID: <b69a58d5-d558-2872-39c0-07c7944ead4a@gmail.com>
Date: Tue, 25 Jan 2022 19:05:54 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 4/6] debugging: Fix typo (heisenberg -> heisenbug)
Content-Language: en-US
References: <5baa07e6-7936-4d3a-d2be-75508899f8ac@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <5baa07e6-7936-4d3a-d2be-75508899f8ac@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 debugging/debugging.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index d5fbf471..13a3c59b 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -1718,7 +1718,7 @@ to create an anti-heisenbug by adding delay in this manner.
 Of course, this begs the question of how to find the race condition in
 the first place.
 Although very lucky developers might accidentally create delay-based
-anti-heisenbergs when adding debug code, this is in general a dark art.
+anti-heisenbugs when adding debug code, this is in general a dark art.
 Nevertheless, there are a number of things you can do to find your race
 conditions.
 
-- 
2.17.1


