Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E694423A63
	for <perfbook@vger.kernel.org>; Wed,  6 May 2026 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067846; cv=none; b=vGQf+lQbdMweLYnaXu47yu2svY/S7CVpRNJ+GLfli804YN3C7djJP97QLUj4Y82mdLwjRCebmPKs2Ezt4ZAE6ZAO/tl1+kaEvrJXT+of48/0orgm9E0mmlofxZzHtWep+LevL0CH5qFWlqIoFbLbwuFZoWv5BXmFFGOjC7UmIlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067846; c=relaxed/simple;
	bh=bva/T0WrptCN/YYpnSOXURGoMQsk0Ic1SsY73GDe9MA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rw+ot3C4mmCzxBUVx4oMULPOUzlchovrxh8qvVAds9retleixLlVLRidKrlLbPtbMpJeWWkFxxOmz9kfFpBkFhwI6Qk92gO6+VtPBAmRYF9ydK97w4GyBsgF0EI0vBCRiQNYQXW/od0SHZBNRKuRJBowaI4prRB6RfF2qGOSk8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HjDIAY/o; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HjDIAY/o"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ba17c8cfacso34300685ad.2
        for <perfbook@vger.kernel.org>; Wed, 06 May 2026 04:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778067845; x=1778672645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fz9DjUbpYr4SGGIgtuGvsQsV52cVbbgYOENIbltSC+U=;
        b=HjDIAY/o3CkSZSmzubpn2MsFNE0GFEKjXUBT7YrQVAqXJ/KDskhEtqah5XzLb3P7bH
         nXopJbfuwie1atoXL28WnBMZGOQrpl69AAKfDt/coLATuKlVdXnQRdJNdRiYvRrny4D3
         8iXFNrYYlAGO3J+j3oZzKzCRJhKkMgx/Y6cjsec4EIgZMtaTZkxxgNYFKVqus5ha3R3H
         HKl412X9TW4f0egac7fjkE+SexfcNs644FvvTZJs4GunxmiAWHPsuIyBNm2gwwFoR6iQ
         0BiLzLpUv1F3MbRqpnQTTRgEjWazsFHD/yAWd2MkCV5FHtbL/sjluX+nOCmKBHIuN39A
         tB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067845; x=1778672645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fz9DjUbpYr4SGGIgtuGvsQsV52cVbbgYOENIbltSC+U=;
        b=V4ZFXkJzC81pSjbNvGgxuSTVaLyDlSDg5PMaUDhfqYPQN59hUJk4hDr59SFnV0P2vR
         upcj683m8tMOkgEu11qSdz14sWMUaqCn7CsgRN8i2MElTMVtDzos3+RERV8vo8DfvKSN
         /6s/dBJr05UB2vI4rYfd/yOnHOSRlumavX8kgE2HSP0QUCVN7l84AZCzcMS5snxGZfTu
         955RCUWRsjOEbJNUy68gIDv9jNoVnjEQVfU+MeWU+Qh1rUl9XFEFvmd4pxHOpaqrayLK
         wzKwDoobWy8UwpEj7l71Exqda3kJK30GCAc33tlMEw3qKkPUXGnuoqUm53JNLmCbc6n8
         OUmg==
X-Gm-Message-State: AOJu0YyeVejSSewdPLxRQTSupKz28pZ6VEuKh2Vx7UrqOWpCBx7ZNd65
	f/Mw/odpMfjP4T3g7krH594HpgnIpLHtA7quu8DQJ2Q+MTIOncSZe+yn
X-Gm-Gg: AeBDiesz0dUg1wbt+Vvpa/95ASmZnuHTs0Qgsvr7owXY82jR5OwQGN79ehmOFFtQuf6
	nCfzCWuTkeTNBkd5xqSAn+KkYNXPUZtfrGoCetu2Q6rfMxxlkTfCf6G89bGluyfF0BsJd6spbAN
	kbs4I890OFjsMTdUWZeZl4Zrm4Jr94mrGOkXP6IODtbSwuhSqdSbbljnIZ5dXX+LIfwjVuKpDx9
	y9kBt6VA1o70+BmC7oW9mDrs9BxLS3kQvbyRjUv34yEXqFgqKRvoSe/TM8CT9cXFl7mpHbdtzr2
	B0+XzG4jIslSQYo4SWJCXSyNBdTLs2wBRCf9awevdwRGsVGAV28S0pYHCbM5gBzyX2UhPbUPnwp
	4yQN0riq8uErQvKU3KnDyW8210lCqlb2i5Mtaq5IN4BrWvYbV6WVN5hleg0U2LDqJGhdAkXI4z8
	yYxB/Wu71l2l6Tt8vTOola3p6R8CZ+PywD0Of/OORjZBzU55Rxx1y/mBDgkde7EHl/LpEL0jKko
	UXHrYE=
X-Received: by 2002:a17:903:32d0:b0:2b9:d647:5261 with SMTP id d9443c01a7336-2ba79185045mr28679395ad.13.1778067844755;
        Wed, 06 May 2026 04:44:04 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7ca105desm23694995ad.55.2026.05.06.04.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:44:04 -0700 (PDT)
Message-ID: <313423b6-901c-44aa-84d7-855905587856@gmail.com>
Date: Wed, 6 May 2026 20:44:06 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 5/8] runlatex.sh: Add WARNEXIT variable to make
 "LaTeX Warning:" in .log be ignored
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In testing Fedora 44's TeX Live packages, a warning in .log files
caused build failures with this message:

    LaTeX Warning: You have requested release `2026/06/01' of LaTeX,
                   but only release `2025-11-01' is available.

    Package: array 2026/01/25 v2.7a Tabular extension package (FMi)
    \col@sep=\dimen149
    ### Incompatible package(s) detected. See perfbook.log for details. ###

The root cause of this is mismatching LaTeXe2 and array.sty versions
contained in Fedora 44's texlive-base and texlive-tools packages.

This was reported at Fedora bugzilla [1], without getting much
attention of its maintainer.

As a tentative measure, add a fall-through mode in runlatex.sh which
can be enabled by saying:

    make WARNEXIT=0

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2447682 [1]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runfirstlatex.sh |  6 +++++-
 utilities/runlatex.sh      | 18 +++++++++++++++---
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/utilities/runfirstlatex.sh b/utilities/runfirstlatex.sh
index 3fed1b69..269a3b62 100644
--- a/utilities/runfirstlatex.sh
+++ b/utilities/runfirstlatex.sh
@@ -68,6 +68,7 @@ fi
 basename=`echo $1 | sed -e 's/\.tex$//'`
 
 : ${LATEX:=pdflatex}
+: ${WARNEXIT:=1}
 
 if iconv --list | grep -q -i iso-8859-1
 then
@@ -94,7 +95,10 @@ then
 	grep -A 4 'LaTeX Warning: You have requested' $basename.log
 	echo "### Incompatible package(s) detected. See $basename.log for details. ###"
 	echo "### See items 9 and 10 in FAQ-BUILD.txt for how to update.          ###"
-	exit 1
+	if [ $WARNEXIT -eq 0 ] ; then
+		touch $basename-first.log
+	fi
+	exit $WARNEXIT
 fi
 if grep -q 'LaTeX Error:' $basename.log
 then
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index e9689a99..50aec2f9 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -30,6 +30,9 @@
 #          Akira Yokosawa <akiyks@gmail.com>
 
 : ${LATEX:=pdflatex}
+: ${WARNEXIT:=1}
+
+WARN_REMAIN=0
 
 if iconv --list | grep -q -i iso-8859-1
 then
@@ -68,7 +71,10 @@ excerpt_warnings () {
 		echo "----- You can see $basename-warning.log for the warnings above. -----"
 		echo "----- If you need to, see $basename.log for details. -----"
 		rm -f $basename-warning-prev.log
-		exit 1
+		WARN_REMAIN=1
+		if [ $WARNEXIT -ne 0 ] ; then
+			exit $WARNEXIT
+		fi
 	fi
 }
 
@@ -169,8 +175,14 @@ do
 	iterate_latex
 done
 excerpt_warnings
-rm -f $basename-warning.log $basename-warning-prev.log
-echo "'$basename.pdf' is ready."
+if [ $WARNEXIT -ne 0 ] ; then
+	rm -f $basename-warning.log $basename-warning-prev.log
+fi
+if [ $WARN_REMAIN -eq 0 ] ; then
+	echo "'$basename.pdf' is ready."
+else
+	echo "'$basename.pdf' is ready, with above warning(s) ignored."
+fi
 # cleveref version check (Ubuntu 18.04 LTS has buggy one
 if grep -q -F "packageversion{0.21.1}" `kpsewhich cleveref.sty`
 then
-- 
2.43.0


