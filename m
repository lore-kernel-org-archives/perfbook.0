Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171D924B29
	for <perfbook@vger.kernel.org>; Tue, 10 Sep 2024 00:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725928192; cv=none; b=PdZdpsD2AggwmVKLUqjbBTOvOi/VYFqPEzbagmXflSqXgzwFyumuQrLOtMq7wqoVNkU0fvuurbBcZXLlTguqLHN5SWwpvnCcX27S/QJjXK+rD7/uDeZfqTmvKJjrkBqDCEEmILILJiAN5tNV4Sg7rld2GUE2Go/TESK9BDo0yGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725928192; c=relaxed/simple;
	bh=e7OUvPY1pcErs/51C0RkGaZSjdzHFbyR18OZF9vaAuk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=npSrLRgn5ptseR4OOnIm7v277QpI8KRLPzvknAa86XNSXf6lqPSETPalR7szRAKvXuASjU61cqDJ+J7IEWqWKFqeGVn53gmpK7ADmvUJ8hbYkBsb0cdJiyzp7Y9toydQX+qxt5SBo07PRs0VFZLv6Rujnv+LAzZTKCqhBwdqkss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgadR3OQ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgadR3OQ"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-70b2421471aso3260624a12.0
        for <perfbook@vger.kernel.org>; Mon, 09 Sep 2024 17:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725928190; x=1726532990; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIWX4X7QOkbw/eufAsPOD4WjOYeSSsJPyVO3qKY9eHI=;
        b=EgadR3OQ02mWMuzStexCvA3PZUq1R/hqh9tr5550ksjv9jOgwZE0ZR1f3ri0xKKMtb
         oSZ9idzX6Gv9rCtgabuJChAk5h2Y67dGIgX2TPvXVZqcBvp/KdFSFTCiGQSY8Zpics5b
         ny6iczmJ+9uoR4Rbf69xV4VLbg/denTWBhOPJZUWni/vOW5n6eC6I9Ai/F3TE7XrOgkB
         r4PVB7cYIWiQ6VGKWD8cBbv3S4fTI8c04ooznBk5Nj9CEJMwrgpeS2hy3dRzLoo+JlIS
         1mmavdA1VL5iZv0Fr9XXdMQVfSFYkqx4LVZ+iEGJjnrDqtbas8bRTU5JrJxgSzN8r9Vv
         yKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725928190; x=1726532990;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AIWX4X7QOkbw/eufAsPOD4WjOYeSSsJPyVO3qKY9eHI=;
        b=X30a1laBCI6g0CQ2DWeCoGQjrUdbIK9ogEiz36JyZp5veH6kYH0YzFostxuJ54q2HZ
         SMbwJ7Y40numzT36lGMhDC0ijzjU1mKDCvTGmkvy6nHmVnFNTb86qjOs/S40CLjZmkE6
         G4aukE0Ups8jO2VsTBM1FVyWVEM8rhnM5uxjWHcmxqsxU3aPLwXC9y0REr7R6AnhqB6C
         szRWvhnE8X7DXV6PQXXXLdRdGIOOsI5XQbBwtqT3SSiCd8S7izaVzjJjSBc7DBzAotMo
         n/YTKFoNUty8lfSc1u+xdad3fI9N/f8LHM1jGBPUDKyz6j3TLpWJun38CSzM2VWX5jU8
         1ksg==
X-Gm-Message-State: AOJu0YwbmgodsOJ5kb5h2NifD/+NEDdi1UMpVXgL9KMuyrz6RoNiznbO
	jqf6jFiUOqYvVnJMYQXHGPFfhXTZmLE0m3iq8vqZGxVkNwk302rb
X-Google-Smtp-Source: AGHT+IEz1Yu8M0VlgCrT5E6+UXrxnTNmrjBVzrkDbDkyjeaW89S88ebrLZPbae2c3Ib+PpSuO7bDWQ==
X-Received: by 2002:a17:90b:2248:b0:2d3:db91:ee82 with SMTP id 98e67ed59e1d1-2dad513a8d5mr9923784a91.40.1725928190280;
        Mon, 09 Sep 2024 17:29:50 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc129120sm7195818a91.49.2024.09.09.17.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 17:29:49 -0700 (PDT)
Message-ID: <be9a8fe7-b63d-4035-a72d-accc88e69309@gmail.com>
Date: Tue, 10 Sep 2024 09:29:46 +0900
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
Subject: [PATCH -perfbook 1/2] punctcheck.pl: Expand hint message on mid-line
 punctuation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Cover mid-sentence punctuation. 

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/punctcheck.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utilities/punctcheck.pl b/utilities/punctcheck.pl
index 94cbafc9..317329b4 100755
--- a/utilities/punctcheck.pl
+++ b/utilities/punctcheck.pl
@@ -83,7 +83,7 @@ sub check_line {
 		$line =~ /^(?=[\s]*+[^%])[^%]*.*[\.:][\)\}\']*\s+\\\\/ ) {
 		$ng -= 1;
 	    } else {
-		print "vvv Hint: end of sentence needs new line vvv\n";
+		print "Hint: Break at end of sentence or mark mid-sentence punct as such (xxx.\\@).\n";
 	    }
 	}
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*[^~]\\cite/) {

base-commit: 4c0bf4331a91401672dda6d45a91e17f2a6ac944
-- 
2.34.1

