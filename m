Return-Path: <SRS0=0nXO=SR=jklaehn.de=johann@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jklaehn.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; bh=keX7VDBe7WS3y+
	Agfv7EdRE+eEaiQ7OFBWwWgVB1NjI=; b=CweuyY12SHpKsSvScQgwr2UpFJX3lo
	QBUhokApEdeql1wZhprSE1mAxWInD0wma90EoEC5etJ0SaGhsOrDR0MMgfxqWIXe
	TKGXdNBmRjN6ka6By0b1hX8mCRu40iz69qZ6/5UYHYKsNWIPnXVzVPYTqw7anhEp
	1+oT02EgylJMLrviHB7bb0V5x0lOtM+cefvyb6ev/wb/D74NUQ5NBVIdomR73l5P
	aRw7XreMEkW/eCh37oAnvvF7F0+XYLS9a6UcI3/OeU6M+DiOIEQ586E9NRzESEUV
	Am+FinlQ68lybB/2D0BFguBFji3CC0yYN75H2ib/py5j2ydVtUTP/6Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=keX7VDBe7WS3y+Agfv7EdRE+eEaiQ7OFBWwWgVB1N
	jI=; b=jvZcpBS7elApE4msO+f63hOhIBJ05zzsBIjPosqBHPuLwn1Q1tIoncJ8v
	RwndMf58SPI0T5RiAft7JLtiByBZNk0BYozn3njq+ajIUvFOf0FQ13vb25UTcp2x
	09MacR0LJIBHVDXy8tEhPAR0P2gXRnFWAfdpLVbiWRqeQiiTUMkDc6eA4oYPoZCB
	UxXhV/E0WLjAdWdNfhuphS85XT9ClUlsgEehUe+wh0NyeITNEznwpQc9vQh59gl3
	gWHQhtLQv6EjlWSNzuusevseWH6EMJYq1MaXH7W5annMDKnWFZtqCeHBiei65Y6+
	8fUKlQFo8nxDcbVHvZwKDHytpKRZQ==
From: =?UTF-8?q?Johann=20Kl=C3=A4hn?= <johann@jklaehn.de>
Subject: [PATCH-perfbook 2/2] advsync: Fix call to free
Date: Wed,  2 Feb 2022 18:33:45 +0100
Message-Id: <20220202173345.49738-2-johann@jklaehn.de>
In-Reply-To: <20220202173345.49738-1-johann@jklaehn.de>
References: <20220202173345.49738-1-johann@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Johann Klähn <johann@jklaehn.de>
---
 advsync/rt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/rt.tex b/advsync/rt.tex
index ee0e7474..7b8af008 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -1947,7 +1947,7 @@ bool update_cal(short a, short b, short c)		\lnlbl[upd:b]
 	if (old_p == &default_cal)
 		return true;
 	synchronize_rcu();
-	free(p);
+	free(old_p);
 	return true;
 }							\lnlbl[upd:e]
 \end{VerbatimL}
-- 
2.34.1

