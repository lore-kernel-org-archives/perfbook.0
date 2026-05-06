Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9521643D51B
	for <perfbook@vger.kernel.org>; Wed,  6 May 2026 11:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067719; cv=none; b=aBr0W3p9AZS5GwMGgdEJzP0iidjO57J27LZpHTuPSXoXkvcCatG2YJ4OIUCTQU/YeWSDHJnQ9BufwUJArJyO5CDwTRewOnG9wi5YjCOc5Tc+98kNYAqVzIppVn+pIjip+4e5L3lQPpOAw4UofTqS7Xo/ph8vnvz+rilVYyrxGNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067719; c=relaxed/simple;
	bh=+CV+HXojUTvB6G58xXEjPEo30hfSCgYNxwtISBCvUrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQks/r8pfEFy7BK82VrZUGyeTrpub7+xwVbW19VCh6ra+Swdbi/8FByLyukis4qRuebKdmlYTigGLhaa4Qefq4/fuY7z2p8l+YuQLWZDlH6rre7p66kvldnSTkzWURXnWWlIcPUUDTsz59ExE7T8CU9puretJOKjvBRwbjuJc8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+jcLKPz; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+jcLKPz"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b9705613ddso37443675ad.1
        for <perfbook@vger.kernel.org>; Wed, 06 May 2026 04:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778067718; x=1778672518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VP9yJzCiHGq329TGRjc4uyHIviyz0pO7BrnnV33rHYs=;
        b=Y+jcLKPzmkjo/zlx24ILBJ4J2/roD1GmGseZkmCWchgvx5bYM/pgzU8H5QF6rLlWC0
         ndc7aB01KetTFTujPZrVW0RqasJdwQuuGIaTQ6x89GMdLVMpLLJ2XgS6PGxvWRFTHd62
         0KBpLlAJ9YtzUrE0tq/ful+XuV2pwE/83bdihhcgcGePvJmFFPeoNWM/VTqKeLUybeYZ
         S27UrEddYjcn1X7tXsGO/+oQh2SrWJIXEMCGaRoNLTOnWAzjlE9inw2MKoMo8Lw0TQTe
         +1XaUjIv3/5OjBou5Hu3+NtqFslRYbuiQcDJnzv4eq8yVH22lSH/LjtKgmTGqGIzq3AI
         lszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067718; x=1778672518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VP9yJzCiHGq329TGRjc4uyHIviyz0pO7BrnnV33rHYs=;
        b=d3R6U1P+fJ3IhAUYFKZfyl3v+elzJ458gtj7DG3/8BCAcfIL2dZ6hUwYQ09dB4WTeK
         gCGe3ydl3zqeRKq60UgQnwUuwhhuZPaP6LOOa6x/80fQYww2fIaJCXbQF8r6gleB7Y96
         G4y08jOX5QUUhsCzCWpbFZB7r1VwUhz5pRdreii+dWsUcZVtYLyVFSuZQS0ZoCF0nDMQ
         AyWGswqHTBIHgLNZIL3BBaDHt+VBlbQvQlF/ipP9kG/x9e8kxX6DiWHgrw+1hgWXHO8P
         zXTdu80BBbY81dX5YXZfJUtyhX+y8TvHZnYNmcuDIe+8XFiQc4p0uqDUMnnTcASEOkVN
         aIiQ==
X-Gm-Message-State: AOJu0YwIN6FuvbYwl/iWJfXDDhuN95k9GAPgEUz+ysKhXfDm4hp1spIm
	TwZfXvjIeSqftByateh6PLBfxGE8aOYtcgfwKn/QuRAcBhh6ST1yTNCpoLRJoA==
X-Gm-Gg: AeBDieu33K1lweZfniOKxFmkXTWxLzLNIKhiG+40lR0G8P+yBFIyFmOtlUPFM/u+yZJ
	W+T7NeiJfvZgOsrS3tbRtEBVSb37fpfWDY8EGrOSQf6I92nAu0b5UWqDiYywKXa5UVPQ8aiMchI
	CyN3OGI64nPawpkg9RJGUTuUIqw38Avz+9Q7EptJYylxkZrnAZDQy71pgAeFHH8tD6OYWlF3V4E
	H/vRsozicUQjGSLr4tv52njhqgf3nnQK/kqQQHkucAw0dl4lUk25bX571CjChStH8tgUYEcL3hM
	aXlO7UoEiRbP7XTs2O3YPQY9rpIf96zG9bTGlCzn732gjeoMW4fh82Fx3dFnTLCxdAM9aZY2/YI
	qHXw3NZO3Z8Uh9UrclfGPtIltSmSBlkFfxXMW/1gGYiV5mONzvv4WABO2g5eplZhFf9S49lUInN
	ofE7sf9kTEUaCiSRVvJ5BUzh6YFzSSwdfoHAoXZTWbD56jcsUA3YPhkYsDAUqKqSi0Vfei4Z5Lw
	AAeE5Kfic6G76OdDA==
X-Received: by 2002:a17:903:1b10:b0:2b9:f55e:1c1b with SMTP id d9443c01a7336-2ba78f50707mr27977475ad.5.1778067717896;
        Wed, 06 May 2026 04:41:57 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7ca2563dsm22218465ad.76.2026.05.06.04.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:41:57 -0700 (PDT)
Message-ID: <e536d5ad-2068-489c-af45-67724c929b94@gmail.com>
Date: Wed, 6 May 2026 20:41:59 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 3/8] Cope with iconv without ISO~8859-1 support
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

It turns out that assuming ISO-8859-1 available in "iconv" was
wrong, for example, under openSUSE/leap 15.6.
Fallback to plain "cat" in case that is not the case.

Fixes: 00361e8bb1e5 ("Convert *.log files into UTF-8 encoding")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runfirstlatex.sh | 9 ++++++++-
 utilities/runlatex.sh      | 9 ++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/utilities/runfirstlatex.sh b/utilities/runfirstlatex.sh
index 676502b2..3fed1b69 100644
--- a/utilities/runfirstlatex.sh
+++ b/utilities/runfirstlatex.sh
@@ -69,6 +69,13 @@ basename=`echo $1 | sed -e 's/\.tex$//'`
 
 : ${LATEX:=pdflatex}
 
+if iconv --list | grep -q -i iso-8859-1
+then
+	ICONV="iconv -f ISO-8859-1 -t UTF-8"
+else
+	ICONV="cat"
+fi
+
 echo "$LATEX 1 for $basename.pdf"
 $LATEX $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null
 exitcode=$?
@@ -78,7 +85,7 @@ then
 	if encguess -s iso-8859-1 $basename.log | grep -q ISO-8859-1
 	then
 		mv $basename.log $basename-tmp.log
-		iconv -f ISO-8859-1 -t UTF-8 $basename-tmp.log > $basename.log
+		$ICONV $basename-tmp.log > $basename.log
 		rm $basename-tmp.log
 	fi
 fi
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 5346bb3b..e9689a99 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -31,6 +31,13 @@
 
 : ${LATEX:=pdflatex}
 
+if iconv --list | grep -q -i iso-8859-1
+then
+	ICONV="iconv -f ISO-8859-1 -t UTF-8"
+else
+	ICONV="cat"
+fi
+
 diff_warning () {
 	if diff -q $basename-warning.log $basename-warning-prev.log >/dev/null
 	then
@@ -90,7 +97,7 @@ iterate_latex () {
 		if encguess -s iso-8859-1 $basename.log | grep -q ISO-8859-1
 		then
 			mv $basename.log $basename-tmp.log
-			iconv -f ISO-8859-1 -t UTF-8 $basename-tmp.log > $basename.log
+			$ICONV $basename-tmp.log > $basename.log
 			rm $basename-tmp.log
 		fi
 	fi
-- 
2.43.0


