Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA8A274641
	for <perfbook@vger.kernel.org>; Wed, 17 Sep 2025 11:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758107253; cv=none; b=Cfu8tqc2RtuN0smPoN54fXuJweFlhE0vxyC7XHl/KAzMlOslD3nUJQwpM276NfE2aGCA70mp1EnCmyadvw62T4W1ODBvDmTBKzPL9/xO45QBy3dpefjmGeE+j/48cFeI7wfF/AxupBcG0k4LrRcVrTDZGWaVSaWpBt21OI/HXWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758107253; c=relaxed/simple;
	bh=W/VL1imO0MN2uh0uKsL5Ic9Yw5gm5sOUXRYRjGA0ekg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=XufkYTDb2ibH2r2aObDBM8n5fxxjhD6JNj9UyzawPRGGqGmP+LRqR0UHQz3eMrMobDMn4RROs5IRZz/8SFaxSuddkYiAJFMMy5eM/e/mtKVu3I0J18q40mWEci42e9xffYtWl5R1zWrQteT50kHdqH3Sv5/eyROTeIhxtTmWifA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SY9Cjjd9; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SY9Cjjd9"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b54a74f9150so4621698a12.0
        for <perfbook@vger.kernel.org>; Wed, 17 Sep 2025 04:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758107252; x=1758712052; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUpC0oAq9RylFz4Q8VUu2rWnF7YeP1+VRxVhd1UFP9U=;
        b=SY9Cjjd9SdTTl5PRoc4A3k6cn7m9/D9+JKiKc5ZQ22hJFyvBlc9XhWQutYVyR+NY+Z
         kja9TlyCqwIspHiSnUJPSqWXz6WT67J6NTKnR9GhIO9qgjBHV0csOR225jrwwohEb437
         XA3RZk/dopFa5nVYKLXtpE60asITfF0FSVFA1fdyujz2REtuRS1Ccdy+DYUakWIzWhU5
         HNSG3lyhCBTUu8FZtGbgh4NI6W+Uf8Vq0h/pUU3PT1JPSOeO4pc55/xmXuZKcZkvVlds
         fCMuVOxgy3EiBmfroZGQzZVwbem11LCLBcOOo0azlIhr7jWHAu4Nk4CApIDdmFj00BbN
         gTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758107252; x=1758712052;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUpC0oAq9RylFz4Q8VUu2rWnF7YeP1+VRxVhd1UFP9U=;
        b=q2UH194WmZYyqoT+h0Epw32/v/IQTFkddWK2xK4n9bqPQzbGwW1MUq8cZGw2Y6avth
         P2KOXLAomQC8nrwmY2fpdj2gxO4PqZ4Zm8lJO8WjOO0cwd4U3ts9dnbh/oRv8oZYzaX/
         uV7HHPV9p8JVF7AYtyVLXRGgyTXeNS5NgrIIqy+QjwusmnWcFbJR9+r8+WER08If5+Zq
         J/OY7Hlmkd+1Sl8lXa7udnqqxHetecvVaXCeCSBa3mCivX6RcVPuNb/miTQXvy+doNjw
         qoweZ30hpd/+4L00031Hf7SBQ4c2svIBf8v3zoOAqXHlDdmUZbeoMS6ZPXKSoPU53KIv
         ypHQ==
X-Gm-Message-State: AOJu0Yw8+HhnsWrNFpjDm+aCIAWOzbHSZeacYTKAsB3KwPEnyyHxGKTq
	UKcKg8YOPUXWoz4ffuH44WqmnMooOJvIFpGkgqfjSTTaYWdL3wbxqNHaSC+1wA==
X-Gm-Gg: ASbGncvPcwtzwzc2ZcNqYUaPiWklFm4kurXqBXHewT7VIf0osh7guxKJAExVvs5lOYz
	mlSnQAXWR9GFiXet2w8TpYG4lHdPLsefH0pqDDI2KPkIFOAZTJADOs4ERwohtoLOm4Yz3fbM5ot
	Gabdo2Sgm5rjrrKSwmAffvVi0KLgsb19jEb1Yo5ADfN7hQ/fhGIA4+ffu8JPusGZvAS96dvit7o
	IlDPEJSK1u3h3GXZY1bT+4oL/Drjf4ZeWIg15LhyroUnBOLp+2aKv+koMpAimzCWkdNh6q4X75s
	VMQQGvhQicUSNgpe5JPPkOg3vJycL44cFRHl7nrrYqAZ+Eg+u3S/Rg7qML0bH+txOo44mqTqF7I
	Dh1BUeZSL5PsNnoXOC7+lG7ryIY8YwuY8IwU54ofumL+AF22oB+3mTdgJR7fSBAgMcc2p
X-Google-Smtp-Source: AGHT+IG6xts4/PdABwyWcpJd+h8+y/t11huNMhQEiI7HwSLbjJ6yI2zWhHrOuMjCnru7K77xONVxqg==
X-Received: by 2002:a17:902:ecce:b0:250:643e:c947 with SMTP id d9443c01a7336-268137ee403mr19767575ad.28.1758107251833;
        Wed, 17 Sep 2025 04:07:31 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2635c79cd21sm111995965ad.49.2025.09.17.04.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 04:07:31 -0700 (PDT)
Message-ID: <4e1e5582-219b-4021-ab7c-efd8d34a20d3@gmail.com>
Date: Wed, 17 Sep 2025 20:07:30 +0900
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
Subject: [PATCH -perfbook 1/2] advsync: Fix minor typo (atain -> again)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/advsync.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index a7ddc1f4..7342e323 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -430,7 +430,7 @@ largely orthogonal to those that form the basis of real-time programming:
 	\item When I/O rates are below some specified maximum.
 	\end{enumerate*}
 	In contrast, NBS's forward-progress guarantees are often
-	unconditional, atain incurring unnecessary complexity and
+	unconditional, again incurring unnecessary complexity and
 	performance degradation.
 	On the other hand, some recent NBS work accommodates some
 	conditional

base-commit: b942a646514c03089255d52056470181127c47bf
-- 
2.43.0

