Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320B43368B7
	for <perfbook@vger.kernel.org>; Wed,  6 May 2026 11:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067971; cv=none; b=rjajKkpINu6fMBBfuAgzc04xfuCNjHmvsFDtcQt6kOVJCCpriuYlASi7imlXhYhJLwdn9/sNkG/mM6SNJej/2wGzR4IxDcEYIdazVbG7VRIyVaSvmnNm6jQ8c+2QXlsq8PJPfacPE51Ys8hfqUqPyAiYFoSGn84aR3WAe30KpOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067971; c=relaxed/simple;
	bh=ly+Fq6cR0JRBsXBiaGyvQggeWMo9taIJKHTFkYVTmUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pvet2c9zjOWZdaJssoRsxRPM0kNN0hKdhupblIJJP04Lp/REX06CzoHZQn52gx/FOo0m/SmH0D3CubDRTdhDmk8TcsV4+FHFa05BRyeM4RFczpFEoxYpgoc3SKklxcnFdwUXGfrJIWdxLDNue/zY77bI71XtwWUi9xy49TtsuYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+C1b2h6; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+C1b2h6"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-362e30526f8so2682128a91.3
        for <perfbook@vger.kernel.org>; Wed, 06 May 2026 04:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778067969; x=1778672769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MKhnVYrUtf5/eEMkcj26SlcMFwSSla4LVH8iY8StnII=;
        b=D+C1b2h6akmuVNO85kop1E5vDTn8+o6adt5x3NE2o9m4z+XvLM5g4DdCCgs4sxCouL
         RhAGV95QhC1kBuDvVH/PXsMTRMqTHQz3QILUOa1fqLaprBqnZ9djRh0Dd2yjbTTzrWI/
         fcPxH0bNfRznU0+ug9s3lpfxs6RIqA9VfRUrOy5WxxfQyT2BHoTW9PXJoWCGoP6nN62p
         tuTkhXe84q68JgxEbivPlr3fHuzfTPLzZc3n6Li2vkdsgNLqfVbMxybXiUFwS5yZZZyJ
         sR15ghS2olpXk07bXuM34kPz0PnyKB/ZEaD/zARm5GzBaRBya/TjLXBj0dO+3IutR+HK
         TgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067969; x=1778672769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MKhnVYrUtf5/eEMkcj26SlcMFwSSla4LVH8iY8StnII=;
        b=WNF2v8UdfWT4wbX6IG8OcBAb6wRPmaazXCSDiU2LaWjISt4lNJxu4cWCgQZI+CRqXK
         I7m5ju42qtG86H5lLqWiZGP5BNeYKlU4hLPokUeUL8o7qbdOUA9vOYQZ8okgGxt3bHXN
         jnRnDod99gRobrqHSen1+oJ/lyDzSKsGG7jP/kknZ/ps5oYgoAPzBvUhDtdqMhES+r9n
         om9ptBVCNUfzeiwrZTJtBCuGE/0gQHnw7RSAnaF01MCKjLvI8TCk40AdVxy87ZDo/wxd
         q21tEshwNb5ScDr0fTF8RRIxqCQfR/fT1PnV3a9ml4X6G1JHlpEvMMPt59jDxKhvlLpu
         H9yg==
X-Gm-Message-State: AOJu0Yzi6nZ2CvzEey7InCsXEIpchdBeDGeLH83NXXBynIDKaobZMxDK
	1aF8S5xISfCUPlztBCFDT1X+Y7nfnUGlra7BVlzhnnzZQFelqcmP2MMl
X-Gm-Gg: AeBDieva34KBSi8HrB18o9hGyZXCXrXH1DgU0RifCzQRmpuAaBlL+//+r334WGczIJH
	HJvxGSTJX9LwYyEGo5LmPlXdDy8hGCBaBOY5MmXt9vMfo21ChQorrbjjbEEDPvBqYhCNdGNMhSL
	CCr/YCdtjGQTQ5he12UEgvjutxgmiBZUCXHhipkFKFkMCvlC+vhHA+0jqphQ8l2/GMTBZny20a+
	62W+LjO+NYX2PmY1JNGoOxqJtUk9j+d/4K4+9+Y0J2HQON0s8IKUc42eucV6sbGRB1+Klqg1xaj
	TxomvESS9C3iftlEcF3uq8x0iFM22qlHzFaf7B0DRLUEmO7V4k+EYxXR+QsTncmDmi811aeUvss
	IUOVJ/IfLmzOVItOx/+dV8g04Wa97CWFVQHRDpJeOzUgBSAoLdRRjo0mQC0SRfFK1mePca9uGMV
	Ashr0X1JUTBy98vY2YA5XGxKbd2EA78d4V1N4N7P8+bQFY3Uh7wJssR/37sl3BAwWmICug3qSaH
	5ZEHGY=
X-Received: by 2002:a17:90b:3a0f:b0:35b:9896:cbcd with SMTP id 98e67ed59e1d1-365ac9913f3mr2849669a91.27.1778067969420;
        Wed, 06 May 2026 04:46:09 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b06bce16sm1171486a91.2.2026.05.06.04.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:46:08 -0700 (PDT)
Message-ID: <1dc3f4cb-eca8-4dec-9fab-40134432e825@gmail.com>
Date: Wed, 6 May 2026 20:46:11 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 7/8] precheck.sh: Add check of missing LaTeX
 packages for Fedora 44
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Due to changes in dependency of Fedora TeX Live packages, existing
list of packages in FAQ-BUILD.txt can fail to install some of
required LaTeX packages for perfbook.

Add checks for their existence in precheck.sh.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/precheck.sh | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/utilities/precheck.sh b/utilities/precheck.sh
index d98bb0de..cce766e5 100755
--- a/utilities/precheck.sh
+++ b/utilities/precheck.sh
@@ -46,6 +46,28 @@ else
 	fatal="date-format $fatal"
 fi
 
+# test availability of ptmro7t.tfm and pst-tools.sty
+# (to cope with Fedora 44's change in package dependencies)
+
+KPSEWHICH=`$WHICH kpsewhich`
+
+if [ "$KPSEWHICH" != "" ] ; then
+	ptmro7t_tfm=`$KPSEWHICH ptmro7t.tfm`
+	pst_tools_sty=`$KPSEWHICH pst-tools.sty`
+	if [ "$ptmro7t_tfm" = "" ] ; then
+		ptmro7t_result="NG"
+		fatal="ptmro7t.tfm $fatal"
+	else
+		ptmro7t_result="OK"
+	fi
+	if [ "$pst_tools_sty" = "" ] ; then
+		pst_tools_result="NG"
+		fatal="pst-tools.sty $fatal"
+	else
+		pst_tools_result="OK"
+	fi
+fi	
+
 if [ "$fatal" = "" -a "$VERBOSE" = "" ] ; then
 	exit 0
 fi
@@ -84,8 +106,24 @@ if [ "$date_result" != "OK" -o "$VERBOSE" != "" ] ; then
 		fi
 	fi
 fi
-
+if [ "$ptmro7t_result" != "OK" ] ; then
+	echo
+	echo "------------------------------------------"
+	echo " testing ptmro7t.tfm                      "
+	echo "------------------------------------------"
+	echo "ptmro7t.tfm ...  Not found!"
+	echo "Please install texlive-collection-fontsrecommended."
+fi
+if [ "$pst_tools_result" != "OK" ] ; then
+	echo
+	echo "------------------------------------------"
+	echo " testing pst-tools.sty                    "
+	echo "------------------------------------------"
+	echo "pst-tools.sty ...  Not found!"
+	echo "Please install texlive-collection-pstricks."
+fi
 if [ "$fatal" != "" ] ; then
+	echo
 	echo "See #14 in FAQ-BUILD.txt for further info."
 	echo "fatal: $fatal"
 	exit 1
-- 
2.43.0


