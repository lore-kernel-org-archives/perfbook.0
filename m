Return-Path: <SRS0=dEfS=SP=jklaehn.de=johann@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jklaehn.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; bh=dCsJrNk6Umuo/u
	q3O9ypsBuEdo/Z9NOSsaLwKGEvMIE=; b=xhjts2vwrhO5s7tGvnXNuEPk9VDysW
	/Xg/4IAQOh+VHgmIQEH1xFZX6syJD2986tp5s9oigKbZRE46YNCAJdM+OyuDpETz
	U81uLbg+llpm+uj1XuED+GNEUxXNTbLrK3uJo2SRu7fC1707/xr41Gn0XLdsFl7p
	99T9GVIGAVlfN3zvTZ/7y90MqXGz8jyUUF0TkGk7EJmnyJoiK2gdK3zP582Nn788
	wGhMg1rhxSlhSNSuNDA/+eflMzGG5/rF+NdKB9scIW/UcqNlAITv3O4w4fG+GElB
	MZUx7q3OPyco3GTJG0h2z4w3yyddpNilZen60NQ/BNWAoiqqjbMrancw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=dCsJrNk6Umuo/uq3O9ypsBuEdo/Z9NOSsaLwKGEvM
	IE=; b=S/OJbZXDnOOVLr2VjZ6QJEJcMQvknQjjHQj/Txmpe6AmAMqCp+VJsYdTh
	7j9l31pyv9w5IAmqctHeR2WaCNZKIZJJY4YuKtzqZs4N2W+iEgTsPdYX175G7tbD
	dtkl+Ik72zAA+8aOabvpUE46EOB7b7oT5ZTluuJWq9rFNaYNMuAlku754g/OaoGI
	zwPzlPul5H6OPkKIieh+4YqiL5wrZ9+3EbTlwsBwFUzevFbFRK7TQ+R4su2Qb3ya
	fBqC1kZ9CFBiTqCkCwwVHapQMITJiPibUUFZf5JOeT/5NgNOfZ0PNtGBGnFEB6JI
	TCjBHscvTAMbmIRpCRUPS8tH/2StQ==
From: =?UTF-8?q?Johann=20Kl=C3=A4hn?= <johann@jklaehn.de>
Subject: [PATCH-perfbook 2/3] SMPdesign: Remove redundant word
Date: Mon, 31 Jan 2022 20:28:25 +0100
Message-Id: <20220131192826.140138-2-johann@jklaehn.de>
In-Reply-To: <20220131192826.140138-1-johann@jklaehn.de>
References: <20220131192826.140138-1-johann@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Johann Klähn <johann@jklaehn.de>
---
 SMPdesign/SMPdesign.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 8f4655bc..5c2c1fe8 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -912,7 +912,7 @@ shows how our hash-table search might be adapted to do hierarchical
 locking, but also shows the great weakness of this approach:
 We have paid the overhead of acquiring a second lock, but we only
 hold it for a short time.
-In this case, the simpler data-locking approach would be simpler
+In this case, the data-locking approach would be simpler
 and likely perform better.
 
 \begin{listing}
-- 
2.34.1

