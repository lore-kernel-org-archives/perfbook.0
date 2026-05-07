Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83DD3EB809
	for <perfbook@vger.kernel.org>; Thu,  7 May 2026 10:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150271; cv=none; b=JxZYjBsyZ4rOtkzEXQHTs8qywW2NZ1A9KlkPen7hoQ0XoaHkrnjVdTCWKW1Hl0LOUjvNIsodD904929DcdJ19h80YUYqAI+wSPKM5q8dnj4K4qQEcVBXUxbksNudKC519fZYacZZv5Y2+aDdIPbtSw5zHFJjGfLK/V+9/bKO028=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150271; c=relaxed/simple;
	bh=2U1wjB/UoQ9ZxMclXfTpLxGxCQH8CHoDSicHnnPeceA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lf1fuBVWjdc4/SCxYkMCDrX7r1pDjg75USRDPd0SdAW2TXPzkqNPIg67/k9Pe7co6IKvw+HQ2vU6uicRH3a349tS1Y8bN987/V5niZ15JzpfEC47nrMgY9lae1tTNoXJxvfeJp0ozVLwAFXpXHuA2rPm2HLifPbRBRlLeegB5PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q73s9fLm; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q73s9fLm"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36608b2f2dcso318766a91.2
        for <perfbook@vger.kernel.org>; Thu, 07 May 2026 03:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778150269; x=1778755069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2SKSGqP7dQiXKpXO3WTkyl5UwG0UIfXAP/O4ni19FPA=;
        b=q73s9fLmqSZZPw2oEllqexv5khOu7wejEdC2RMKT0GIPaqrj43btlXE8G6ADck5dqm
         DsmllXwjTo85OdYdGcWJm5yYI8iMuxFTtDUORrE6+gUQWtw7en1cHhmKSzDfKlFqTunk
         0Q7LfjvvXhMnf8gvDp+jVsON1N/+VU7cQTS52j6W3c41/G3yEzdCdgw2Q9tKHR9tzIgh
         i56t4HNNL5VC596mrkqZHEBI+uZPd46tqGnAKVOdNYDfXXFItnd2xZVuUuXTQiD80t/b
         aJENtkjvBffd3kLysOj6SD9TlVPJ4NFDo4fNoqXcJzpIaaLjl7dsypqLadru6E9oUe1e
         LDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778150269; x=1778755069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SKSGqP7dQiXKpXO3WTkyl5UwG0UIfXAP/O4ni19FPA=;
        b=leCBljOm4wLAGS5u3okMa1h8XkMMSCrv9kAz2QuZ2mVSjo9E4HVXhb4wm5nRr/g6sm
         xThhjS+ntuvbmXFuH5HomuKPeWIEZnfZPMQbrt8gdgGIcL8otEm6mrsMehcO8motIjwW
         MrSAEUe/c/leC0kxnpy8uBnQEYJSZXZ6JFYi9a0xeXNHcMoMWbhM5gZky0cdhP3fcCZv
         69rhEsh2rdUJGAib+Uhg3gM25eBGJ9GJkp8TVZcbjvsFVqQTR+Eio76nHUcV0FkCa5lO
         f3nH9FsdvrNa/Gb+b2fsUOqF+ao9UDIIDfudUU9/QR9E+BWh0jAYwW45FnjuuA1gw30x
         Wfzg==
X-Forwarded-Encrypted: i=1; AFNElJ9M883dT+a2u57l8zoY95NBR+Cn/zkDlI7Qk3s76+RdI+B9nFsTr0u2aP4W6rMFsOYIxk74xw8IUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Hz1QRC5fX2Ky5lweV7bK0KqWL2MH6RLrSUrOK6Uf5p5XKmEV
	GkRQQFKk+GsvVz/NIjMMF7cMWHTDrj2BY/gAjrutxq51L4OlFXdHMUFZSMFAhQ==
X-Gm-Gg: AeBDieue+nBK3jecN98jYucg+9lcOYlFsOh7QvLkk85hEMK/21GPu798s7AUAQZoVcu
	6nOfLYV5oDb5b7vkefI2BHjvwvAOVO8AjSqKrgd25T0qFvBt103Xu0g8arA8zXQm6UWKMyQZcdq
	lKWLCBaokWEMBi7ynjn2i/zcAsJi5VZBnoKtSK30rEY5EDvl5V927VMAvygIe9n+yzI9QBpToyb
	HIX3IKc5cz7s+ntq5GevozGfENLAhj2RRGU99a4SBOfnJZjCkT2gHXS7ZShz5E0+qpDusA5lQb0
	3aeH3XYI8gKTzPRmQhUjuvQ3GHcbjka0VNtiaoHLkJRww35sGnLl3uxOCn0eIs//+dWh17pZTP/
	rYklcgr0lZNfG3Qy794ndPnqnXgpBlko52Zfh3TCHQ+gviKnr6LfRMWrxNvTN6mmB0Z2o94R6LE
	a7rrEY9A+CfQvXNup9AfaGwH1zmEg+QlvTQLbE23mf2W2wniJKDhAoIbS3y32hZD7do0t2n/H02
	Qa7lME=
X-Received: by 2002:a17:90b:1c8b:b0:362:f860:f9ba with SMTP id 98e67ed59e1d1-365ab9b8e33mr7198477a91.1.1778150269016;
        Thu, 07 May 2026 03:37:49 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4c93aadsm6870801a91.14.2026.05.07.03.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 03:37:48 -0700 (PDT)
Message-ID: <e3237552-6671-434d-a3b9-53a7a5257685@gmail.com>
Date: Thu, 7 May 2026 19:37:48 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] precheck-tentative.sh: Make array.sty probing fail-fast
 and deterministic
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: Kunwu Chan <kunwu.chan@gmail.com>, perfbook@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>
References: <20260507095011.1551131-1-kunwu.chan@linux.dev>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260507095011.1551131-1-kunwu.chan@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Thu,  7 May 2026 17:50:11 +0800, Kunwu Chan wrote:
> On systems where kpsewhich cannot resolve array.sty, the script fed an
> empty path into the version-parsing pipeline and then compared an empty
> array_req_ver against latex_ver in the non-pdflatex-dev path. The
> result depended on environment and produced no actionable error.
> 
> This is reproducible by overriding kpsewhich to return nothing for
> array.sty while keeping other lookups intact.
> 
> Add a guard before parsing array.sty, set array_req_ver only when the
> file exists, fail fast with a clear diagnostic when it does not, and
> correct the warning text typo ("arary.sty" -> "array.sty").
> 
> Fixes: 4cad3dd1174a ("precheck-tentative.sh: Fail early with suggestions for Fedora 44")
> 
> Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> ---
>  utilities/precheck-tentative.sh | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 

I didn't think of running "make" before installing texlive-tools bundle.
That said, this can be helpful in setting up brand new installations.
And thanks for the typo fix!

Acked-by: Akira Yokosawa

Regerds, Akira

> diff --git a/utilities/precheck-tentative.sh b/utilities/precheck-tentative.sh
> index 96d2fe2f..1e106877 100755
[...]
