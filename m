Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B984F34BA33
	for <perfbook@vger.kernel.org>; Tue,  7 Oct 2025 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759848517; cv=none; b=G4XMu2I3YB6FMnxq9QZI9RNDLEVNxyIlSwnYCZhsOypI4IkR+SLuCbT0V8ZdH6TIfxepHGSkEMAk3jFh/yXL8B1fHFPpTHJtOhNkO8+TxFur0lz7G7pLQ4zWgvDC3Iipx/H4Rd1Yo25gqTy4TmiGbRZG79Go1cc7fxGYi9xJR3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759848517; c=relaxed/simple;
	bh=ivhYQpN2gO/nQOb/+2VwGh5km6Es7QzZ/3ejIEKhmWg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=QfvuIrM1zSo7S68RLMQj/p/cmZDlT288pU342E66/FQ5rAFzYbby4XGaf9OWo15BOVLWQwpA0tSnbqql4T4GnoE+hr6Fos2UVWS5sackj8tmKlU9TdiCPBdK/UWu5niX9LFof7YUsDg/e7W17sDJyIGMeUEbf8Kz1aG3rVdMb8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hlus2tdC; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hlus2tdC"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-339e71ccf48so2729466a91.3
        for <perfbook@vger.kernel.org>; Tue, 07 Oct 2025 07:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759848515; x=1760453315; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0Pp1jhZiKI0K2otXsVyAr3GccDC+lr9gx7W+oB1XFo=;
        b=Hlus2tdCL3AWL9F+PkKGXp13XAbSumnf+VmBYDMjmsMxLbYiCfHcXZvMZcBrHdUPhI
         GAcGsiBJcoYcGSGu/K0OhHc3YcOuljFVQDLB5bB8bnazp10nf8jwR13EXfE2hWxURtXF
         EdyoEj0CXFlTr9EPFmOxKhQNz+C5zyZ1ufrNZcpujDA4K5FvUJUdYcRNw5/thIfNxken
         e9nkDaz6hurANEHDbmDHanrM8VIYJOu+LX8zIh/aJp+6BXJbk/4jCB71X+iyMDnNe/6V
         +1BsVfKvNJq/q3AK0YUuy2XWz5nqkXVPzWVZ8fajsWGz4ipwSdMNSd8N3ESkWOeVS+9u
         8wAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759848515; x=1760453315;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t0Pp1jhZiKI0K2otXsVyAr3GccDC+lr9gx7W+oB1XFo=;
        b=xDuq2VsTXYZXmf77JzWu7tgUjm+o7cyRAoO1EnYbn7ZwQACW60J4dJScaLVUqU4umo
         TpJ2MdUAjulmM8ZWaxUcMRp7OLQmZSb55JZG/0xUT4AuRWzLCEmI7hXe1LlgEoW2uD2L
         vb1/ttfu0AVu/G03X/EraFhmUBfzZSdr/KOCmr0iJL+fqLomq6RWB5wGxaSK1JmZqJhy
         p2QN4ygpKyU/u/+agZtgRj+S+ad/5D11xvWkg/FIgw/v7z2pYcEc04fsaESQw7ujfL9Q
         kLFUUskK8nQPSVKBHWZ11495wN0nLSkwHmoilYcOUfWl0zgDvZe0JhjlazpiT+JVoBv5
         At/A==
X-Gm-Message-State: AOJu0Yxr7/Hk/KBDgjSNBOEF9Mwmg9BRLvSuixzEDGYqbkY/yC3OthY0
	FXYqCtrhlcdCn9QfnYyBHCNft/sv8JMDvdypAu1pbf5/iaEzY/hdLKoa
X-Gm-Gg: ASbGncsE9skfZx5RZJ7jbmRqIHjJv4Ds/ZdOX7qXiF5jjztL7NmPBkN1EL9LFAVnoBq
	jUclPVfZfp6bJX7+aHlBgYBZTCr6KyFhMmfH/WXFwxdCfpLyj7phs2Iohx3+6dwsI1dk2PI7T2+
	O5Hy00JYbblYPODhF9B3l8ktaf5LxkVg7IuC7T+T//dO83U9Cn9xvwK2n3Q9C11zk1tlBDWK+M+
	A+4Jf9Mo4nrAmjXV5c1IYfJGVLATYJRllmmStqtd0yzRCF3I2iaVlCoRLyuIy5MOX1gbFGTKGRk
	gm09EZalov956aJIKYWS2F/bVPZ1TmVRN8jdd7Dvs41//XTBXyYyV6Sbl0jl6HefcyTerN/wZZC
	p6E9TSMHAuT37qIP9qUOUTHiH//AiEebsPC7h8XGyVeWZTquqeTk6PORD/exvqexSdKqDIxeCVh
	zL+7sDRhQzFlCE0cUC
X-Google-Smtp-Source: AGHT+IGSQ7j7LsJFK+t+lx5aOyvtw9Z1N0G3gOsPUUF4jjR0XSxSx5j5A1kjE4dyadN33XigaB9Y7g==
X-Received: by 2002:a17:90b:1f90:b0:32e:d649:f98c with SMTP id 98e67ed59e1d1-339c2724b72mr18194614a91.1.1759848514803;
        Tue, 07 Oct 2025 07:48:34 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339c4a1aa03sm14696432a91.12.2025.10.07.07.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:48:34 -0700 (PDT)
Message-ID: <50018985-d907-4028-b118-50c4c9fe894d@gmail.com>
Date: Tue, 7 Oct 2025 23:48:34 +0900
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
Subject: [PATCH -perfbook 0/5] together/applyrcu: Final touches for recent
 updates
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

Prompted by your recent updates, I have looked into them and made final
touches for them.

Patch 1/5 is an independent update of rcu-test.dat for Linux v6.17.

Patches 2/5 and 4/5 take care of line-count references by embedding labels
in the .litmus sources.

Patches 3/5 and 5/5 add non-breakable white spaces around one-letter
variables and single digit numbers.

All of them have only summary phrases, but I think they should be good
enough.

        Thanks, Akira
--
Akira Yokosawa (5):
  CodeSamples/formal: Update rcu-test.dat for v6.17
  together/applyrcu: Use \clnref{} and its friends in Section 13.5.9
  together/applyrcu: Use nbsp around one-letter variables in Section 13.5.9
  together/applyrcu: Use \clnref{} and its friends in Section 13.5.10
  together/applyrcu: Use nbsp around one-letter variables in Section 13.5.10

 CodeSamples/formal/data/rcu-test.dat          |  1 +
 ...usync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus | 26 +++----
 .../formal/herd/C-double-check-rcu-2.litmus   | 32 ++++-----
 together/applyrcu.tex                         | 71 +++++++++++--------
 4 files changed, 72 insertions(+), 58 deletions(-)


base-commit: fb44848431946e5a42d42fd5dd8a05d6a2298805
-- 
2.43.0

