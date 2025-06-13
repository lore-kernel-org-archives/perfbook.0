Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6B224DD19
	for <perfbook@vger.kernel.org>; Fri, 13 Jun 2025 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749807200; cv=none; b=nkKvOsNfNK+0R3pLyRoDk+KcN4Lh9hzYsZEaGkl9C1zNnwMe1U9bX1Me5lQevPSkB8S5pkogieOQoBMfInwOnn0u+oq7PER5zUnBCU+BnCjo7jjeDwJVdUEknZhx/NoxkvplT2mcjNShiCTVYaWaOMwAiUaze0XVRIiGN/J0JHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749807200; c=relaxed/simple;
	bh=Fii5RKYxC6wVcuuHxgupPZOMOjFXwfyYMr9RIdwHmlY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=cicb1fDIAxI604u9r4QBZ/M08Rv9RouImZO0jx4ulwA3dAfuEKtFeJpboeBXYHWHebm6GWaru+E6+N0ZYTQt+bP2lThcQNmEMNauv3CFOZn+p6Oi1nwYpIuk7k6QTeIC385j3eKU/s3F/liroaxC7g3bYRguCKEAyXTB5+2DZ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSo2d2YC; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSo2d2YC"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso1681018b3a.3
        for <perfbook@vger.kernel.org>; Fri, 13 Jun 2025 02:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749807198; x=1750411998; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbbSsWJ+i29vQiYOUZvqdiPxsX1YiKG+qLp38/p676Y=;
        b=PSo2d2YCROXc2mbgIoQWK/Derd7iHlMkI1HN6F/e4Q4O8tNWm9ONxwwAs/jGi4ZNk+
         8g67KP5omucRsf0Ag1Xli8261zp84/CoKefP++uRm3RBxxNP/dmSDDgp5+Pt2JQk4A8I
         AhnfOvzt+rQaHQcKBSNMrZECsmc+JF6R/4uaNN3fjeoXOdWb/4M/bZ/r4MLhwlfSRrwy
         8ytBBjBwSSdnHNsokvRd8dH/4x0OcFfLvUWLQJCEj38p1E0X5POpaRX1vGZghzxMnEXZ
         ReaKaqiEf164C0t1EGQw9KPbnAgjxd0saYIY6K5kEDLlkt2Iqinqa8t/ESOTov0JxTUa
         7tFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749807198; x=1750411998;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZbbSsWJ+i29vQiYOUZvqdiPxsX1YiKG+qLp38/p676Y=;
        b=Y4APL1NqbV8Rp4xUXfHGLSpVlTySVjiPTjIiWEZcm+uPwDq22GBJikCZCe0j84R89G
         GqDIt7XQHuyhoXOEAJ6/F6hTHxioEXDCYqIv/Jref4ipF9f04m+wKGzvcOchxCgwh4+W
         zHBTusecU840iBLZdFvYRGy6jQRWnruGPM13lk/VOs4HzLPcj9Oda95PYSf9GL/mROST
         Dka8HkiqXFjZmOK1tS/4CtNtzt0nU7eTdjPfHYxLkWbh3CDfVSWIhQjjJKAhZboRyhT+
         Wft7TP53OXg4Gzd+k/llCyDdXq7f/EhWWZDdCs9OY1e6V1A60Z9numvAcMuUCUgur97j
         rxyw==
X-Gm-Message-State: AOJu0YwXIJfaYw8m2tvDvK9YMruzOK4GiMn9wVM6AX6J9hx8969ldBXP
	SrAVmOjSPEoboUWbFb1IfB94xXhxV9M6+ufczBCjlKpCIbD7GIxnKFm2
X-Gm-Gg: ASbGncsw1YmyFkhGyQi336cOhQmzDTy7aXc32MX4iiJ8zoCVqjCGclXyTrEIkSjs6AS
	QIsdfoDFrkdN+Ud2Fy8FZZk1Y6fuu7FuSv7KH//blwPEYt740hHCmUmpy19dvZ8fb5RamNv0GMJ
	Sb3DtwiUE0+9s7x5FqAx5ti9KcRjwMIhBNPwvGFNCgRtBN5gqPiwyZvViml7xNkTYX6RDg1AN5R
	RKdwnWzsAz6Ksv5X2G0QGXYlC2uB2nl7XdEbPGCRA+cN+cHH1+4YQ9RJXV22hXAUmT/aXZWtZbI
	BVlh98wn/7EG+KxGZV1XkjZzrzFKf3RJYztWgzkW00IQ+e6kUlYojUkf0FgFdOx6IPa2VH/bRmt
	zIfPOh5bx9Q4aEALtyFisqyEQJUOQqH3Z
X-Google-Smtp-Source: AGHT+IEEvxHVIR3RnOHzersc354O9wJU61H2z/i7mwmPSD+tjLNalAVKJKpS2/H6TaJ6qvv2/PBsEA==
X-Received: by 2002:a05:6a00:2342:b0:742:4545:2d2b with SMTP id d2e1a72fcca58-7488f6ec975mr3299877b3a.3.1749807197616;
        Fri, 13 Jun 2025 02:33:17 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b28b7sm1180082b3a.136.2025.06.13.02.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:33:17 -0700 (PDT)
Message-ID: <eec38fe7-eb86-439e-96c6-6604a5893419@gmail.com>
Date: Fri, 13 Jun 2025 18:33:15 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] Convert *.log files into UTF-8 encoding
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

pdflatex outputs .log files in iso-8859-1 encoding.  In our build
scripts, grep assumes UTF-8 encoding for its input by default.

Practically speaking, the mismatch of encoding is unlikely to cause
any harm.  That said, in the build log, there is a suspicious message
from grep:

    ...
    pdflatex 1 for perfbook.pdf
    grep: perfbook.log: binary file matches     <===
    ...

Converting .log files into UTF-8 on-the-fly can avoid the message.

Let's do it.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Note 1:
  Unicode ready modern engines such as XeTeX and LuaTex emit .log
  files in UTF-8 encoding.

Note 2:
  Currently, perfbook's preamble is not compatible with lualatex
  or xelatex.

Note 3:
  iconv should be available by default.
  encguess should also be available where perl is installed.
--
 utilities/runfirstlatex.sh | 10 ++++++++++
 utilities/runlatex.sh      | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/utilities/runfirstlatex.sh b/utilities/runfirstlatex.sh
index a89e8a70..676502b2 100644
--- a/utilities/runfirstlatex.sh
+++ b/utilities/runfirstlatex.sh
@@ -72,6 +72,16 @@ basename=`echo $1 | sed -e 's/\.tex$//'`
 echo "$LATEX 1 for $basename.pdf"
 $LATEX $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null
 exitcode=$?
+ENCGUESS_CMD=`command -v encguess`
+if [ "x$ENCGUESS_CMD" != "x" ]
+then
+	if encguess -s iso-8859-1 $basename.log | grep -q ISO-8859-1
+	then
+		mv $basename.log $basename-tmp.log
+		iconv -f ISO-8859-1 -t UTF-8 $basename-tmp.log > $basename.log
+		rm $basename-tmp.log
+	fi
+fi
 if grep -q 'LaTeX Warning: You have requested' $basename.log
 then
 	grep -A 4 'LaTeX Warning: You have requested' $basename.log
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 358b6baf..17d833ad 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -79,6 +79,16 @@ iterate_latex () {
 	makeglossaries $basename > /dev/null 2>&1
 	$LATEX $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null
 	exitcode=$?
+	ENCGUESS_CMD=`command -v encguess`
+	if [ "x$ENCGUESS_CMD" != "x" ]
+	then
+		if encguess -s iso-8859-1 $basename.log | grep -q ISO-8859-1
+		then
+			mv $basename.log $basename-tmp.log
+			iconv -f ISO-8859-1 -t UTF-8 $basename-tmp.log > $basename.log
+			rm $basename-tmp.log
+		fi
+	fi
 	if grep -q '! Emergency stop.' $basename.log
 	then
 		grep -B 10 -A 5 '! Emergency stop.' $basename.log

base-commit: a1bf2e61230301bfc12eba19abfc1c5a880f53be
-- 
2.43.0

