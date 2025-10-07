Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74D917A30A
	for <perfbook@vger.kernel.org>; Tue,  7 Oct 2025 14:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759849045; cv=none; b=JTm3QbgdrZ5wYQz2rgtyhslQZ2aC+O1k8e1X1SNCsS1PXfsZwviP1B3LxFs8aDOFL7v5ZEx3BtyGY8QODXmMMZpoGDEsuzd6/8LiQkdnsefqDP+sXIcZJG8ZRoH0oQ+bHmtyV1pPBmdCYuzsgDEK+odmFizFvzf+dNR5q5twDE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759849045; c=relaxed/simple;
	bh=WZMueBRX7TI+4FOqQrywDLjZ6UBQC4F5EoO01JxBDOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=foi3QFNfrBlapZQUg7pSvdcJdbg+ZRtjlpZ9hOHqDIObfmQH+BDZtOpPzKvsUJl1wFmQMcIyg2i4tOIVMB062aC7HHuIODo2uk9CFb1sXx+1CZSFxNdkiADt7ulIdw8XladaZJZT/a5nLnLdpspqbeJ1F0+0c8pSrovSqFLVQX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyupPJ4l; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyupPJ4l"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-77f67ba775aso8428130b3a.3
        for <perfbook@vger.kernel.org>; Tue, 07 Oct 2025 07:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759849043; x=1760453843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=waBCe1dd6msvQpd2amjQg/wn/XCoEtNl1P65IVfFok0=;
        b=eyupPJ4lKQ6PWViZuF1BX/CRfiVojAy15ijs8Vx7IXSWsuTd6N5bkvMqmaHaGmM5QU
         4tgX+Lv2JekTY2BAO/JoI9X/0oJCJcZgBXS+26pKsOhZFQ7B+/FZhGLRePoPswSFLEel
         Vnx9n12urRuKNJ7AVBbdBhmqEt33MHfKEh38G6xaLpNldPxPh1xRB9t38pRJoCKOLPsZ
         T39x6rpecKiSnfhMkt5ANASPkv0xqq6cLpBFj7/s9xzGZnZG9nc1UtCdcO2ikBvef2+V
         WzUkHX+HOFSbgwdkdwyO/MoqQF/tkbwJwqU8vQYIhKA86jHnfZF85HkNfAyswMgXnpeF
         ZLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759849043; x=1760453843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=waBCe1dd6msvQpd2amjQg/wn/XCoEtNl1P65IVfFok0=;
        b=RiP+snTRZQRnFP1GTs1HwlJ6+mdfhk5XVycfBtVPvr9+eYI0t0BdtFbTQctfSSYgU+
         vw09mHOb+YzS6hAQIA1iFxTeAhg0y2I7n9AtZEJ3DhjxErfz35AXxL7WMkhXvc9EYwfG
         nXD3CiWtyP5qXnmp2HmoGB/axQtYba3TnFwP2JPdy1+aMn6cjVM5+iV3Z6/kotEXBvVB
         HAegzVMSGWltZYJzUCN/45po4GZTQXB4CagnMLtVRelJtXN+GcyGF3jM3m8SuncL5N87
         HgCJUprqjQAm4DS12pRQHSG5REPn0n5JPJ5iUH62xNNi1olN/xU0o//KebHBwsVOlCMf
         Uz1w==
X-Gm-Message-State: AOJu0YzykHGt4FxVy4hsPJ+NyzzUdjnKn7iCXjS0ajQ4TI9YWZUcmpnr
	QUZrxMHBDMINvVgVvPN1Mjk4phAnmF0oN1Lj36H/qXrPI1cDhXIQtPWtsjJo+A==
X-Gm-Gg: ASbGncsQjAdGw9ih220WjvYQv0Dx+VSZ/EQFa4Mz4tm4DzrpCc2JWJwoe2vpIb45qbt
	my5IV2jJJOKvJzhtHyObzWHM8uPrYZUwhC0BAgolTVaOAtNepwU5OR83vRG/LQRjKmvX/1Q5eOb
	5sOaFAtj1jHplgSjpzQLt0TlTe8St/46SA3TUobyuh/KRRd9y/OA+bapVPP5z0NDpeXOA3OV87g
	Q7i1MYQKZbKEDO5ZSxMOABlAOMbqXO7cTh4BY7MaqHfbccCnhcnxpF1PvHmpiiIuHBaq1qg6OrN
	2HeDOqHskEm6JOf2PXeh/Mo+udHOrojscWQ5+d2C3+NXgx9b974Cko/f2DUpEtC8+1bMWpibb5x
	VUQr2q6+e+1LaU+pGCcssFUQPtQl2/r9LY0tRcjYa1zFRIP4XqwSGqsvQH0yRy1Hfq/aVBmuekI
	M7kd/XcEkFjEc50DHY
X-Google-Smtp-Source: AGHT+IFBmbCGQT2qFGtslyr/RckYoRdndAzR4ogAj49ZKWZB3HTp8EFcVgOKn0VJgrM1n+nJn4ESIg==
X-Received: by 2002:a05:6a00:990:b0:776:20c2:d58b with SMTP id d2e1a72fcca58-78c98dff799mr22088569b3a.24.1759849042863;
        Tue, 07 Oct 2025 07:57:22 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9cd56sm16001780b3a.2.2025.10.07.07.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:57:22 -0700 (PDT)
Message-ID: <e3db9c5a-7896-41c3-99b8-666830caddf5@gmail.com>
Date: Tue, 7 Oct 2025 23:57:23 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 4/5] together/applyrcu: Use \clnref{} and its
 friends in Section 13.5.10
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <50018985-d907-4028-b118-50c4c9fe894d@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <50018985-d907-4028-b118-50c4c9fe894d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .../formal/herd/C-double-check-rcu-2.litmus   | 32 +++++++++----------
 together/applyrcu.tex                         | 32 +++++++++++--------
 2 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/CodeSamples/formal/herd/C-double-check-rcu-2.litmus b/CodeSamples/formal/herd/C-double-check-rcu-2.litmus
index e23bc081..ff7a1dd3 100644
--- a/CodeSamples/formal/herd/C-double-check-rcu-2.litmus
+++ b/CodeSamples/formal/herd/C-double-check-rcu-2.litmus
@@ -12,24 +12,24 @@ P0(int *a, int *b, int **p)
 	int *r1;
 	int r2;
 
-	rcu_read_lock();
-	r1 = rcu_dereference(*p);
-	if (r1) {
-		r2 = *r1;
-		rcu_read_unlock();
+	rcu_read_lock();		//\lnlbl[P0:lock]
+	r1 = rcu_dereference(*p);	//\lnlbl[P0:load]
+	if (r1) {			//\lnlbl[P0:if]
+		r2 = *r1;		//\lnlbl[P0:deref]
+		rcu_read_unlock();	//\lnlbl[P0:unl:1]
 	} else {
-		rcu_read_unlock();
-		*a = 1;
-		r1 = xchg(p, a);
-		if (r1) {
-			synchronize_rcu();
-			*r1 = 0; // Emulate kfree();
+		rcu_read_unlock();	//\lnlbl[P0:unl:2]
+		*a = 1;			//\lnlbl[P0:init:a]
+		r1 = xchg(p, a);	//\lnlbl[P0:xchg]
+		if (r1) {				//\lnlbl[P0:if:2]
+			synchronize_rcu();		//\lnlbl[P0:sync]
+			*r1 = 0; // Emulate kfree();	//\lnlbl[P0:free]
 		}
 		r2 = 1;
 	}
 }
 
-P1(int *a, int *b, int **p)
+P1(int *a, int *b, int **p)		//\lnlbl[P1:b]
 {
 	int *r1;
 	int r2;
@@ -49,11 +49,11 @@ P1(int *a, int *b, int **p)
 		}
 		r2 = 1;
 	}
-}
+}					//\lnlbl[P1:e]
 
 //\end[snippet]
-locations [0:r1; 1:r1; a; b; p]
+locations [0:r1; 1:r1; a; b; p]		(* \lnlbl[loc] *)
 (* Reader better not see freed element!!! *)
-exists (0:r2=0 \/ 1:r2=0 \/
+exists (0:r2=0 \/ 1:r2=0 \/		(* \lnlbl[ex:1] *)
 	(* Better only be one in use! *)
-	(a=1 /\ b=1) \/ (a=0 /\ b=0))
+	(a=1 /\ b=1) \/ (a=0 /\ b=0))	(* \lnlbl[ex:2] *)
diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index ff462a3b..455bf2a1 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -957,31 +957,35 @@ avoid disrupting concurrent readers, for example, as shown in
 
 The fastpath covers the common case where initialization has already
 completed.
-Line~14 begins an RCU read-side critical section, and line~15 fetches
+\begin{fcvref}[ln:formal:C-double-check-rcu-2:whole:P0]
+\Clnref{lock} begins an RCU read-side critical section, and \clnref{load} fetches
 the current pointer.
-If line~16 determines that this pointer is non-\co{NULL}, then
-initialization is complete, so that line~17 fetches the element's contents
-and line~18 exits the critical section.
+If \clnref{if} determines that this pointer is non-\co{NULL}, then
+initialization is complete, so that \clnref{deref} fetches the element's contents
+and \clnref{unl:1} exits the critical section.
 
-Otherwise, line~16 will see the pre-initialization \co{NULL} pointer
-and transfer control to line~20, which exits the RCU read-side critical
+Otherwise, \clnref{if} will see the pre-initialization \co{NULL} pointer
+and transfer control to \clnref{unl:2}, which exits the RCU read-side critical
 section.
-Line~21 initializes the element (abstracting away any required allocation),
-line~22 atomically exchanges the pointer to this element with the global
+\Clnref{init:a} initializes the element (abstracting away any required allocation),
+\clnref{xchg} atomically exchanges the pointer to this element with the global
 pointer \co{p}, returning the old value in \co{r1}.
-If line~23 determines that \co{r1} was non-\co{NULL}, then line~24
-waits for any readers accessing the old element to finish and line~25
+If \clnref{if:2} determines that \co{r1} was non-\co{NULL}, then \clnref{sync}
+waits for any readers accessing the old element to finish and \clnref{free}
 emulates a \co{kfree()}.
 Either way, \co{r2} is set to the initial value of 1.
+\end{fcvref}
 
-Lines~31-51 operate in the same manner, but using element \co{b} instead
+\begin{fcvref}[ln:formal:C-double-check-rcu-2:whole]
+\Clnrefrange{P1:b}{P1:e} operate in the same manner, but using element \co{b} instead
 of \co{a}.
 
-Line~53 displays all variables to ease debugging of the litmus test.
-Line~55 verifies that both processes obtain an initialized value,
-and line~57 verifies that there are no memory leaks and that at least
+\Clnref{loc} displays all variables to ease debugging of the litmus test.
+\Clnref{ex:1} verifies that both processes obtain an initialized value,
+and \clnref{ex:2} verifies that there are no memory leaks and that at least
 one element remains in use.
 Running \co{herd} confirms that this code satisfies these constraints.
+\end{fcvref}
 
 \QuickQuiz{
 	But wouldn't memory allocation also be forbidden in such
-- 
2.43.0


