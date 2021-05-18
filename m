Return-Path: <SRS0=v+bS=KN=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pXyE2O8Z3ZdiA8C3PeXj9FsOoRiQ0NHgqK04Tj2jGHc=;
        b=K4n3XihVbT2ITqCad3mbV+/Ury9Xc9dyfLL0m8PuOH5Rdn/Pl27ErFSfaxat1Pn2HM
         lXiYfIgDktXdljR7K1AO8qq+wuvHwV/tpJEC2dtHXrJzCKSpPrkmHxxRK52La4jh20rU
         NeTdD7dznXKZqQSp8l/RS52M4WV+CdnD1xFSyBl2oiYnVQRheHv250px6V0Tv5v7vx07
         ZlHJ/1oaIw9rWEWGBcAhWUxbiNZBjrP5WK9rhmfPMJmmKdtHS4B3i4j7nDDfRE8ZPeIB
         oCo5x7iqnNegb2f+X7mW3RAvTH9izrs3q1UJCz6C1xNhtxD4s29aCoiHILAcuFb/K0S9
         PHiQ==
MIME-Version: 1.0
References: <20210518161244.7340-1-zhouzhouyi@gmail.com> <20210518173524.GN4441@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2zJD40KwPH0mqSLU5Dvh-pNsaHYxFg7A4WmDSMd15H22A@mail.gmail.com> <20210518183642.GP4441@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210518183642.GP4441@paulmck-ThinkPad-P17-Gen-1>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Wed, 19 May 2021 02:54:53 +0800
Message-ID: <CAABZP2yjqS68aOLZS6d8Vn-=ra4GeHGVnQvMHhdJ0D6SRX7QAA@mail.gmail.com>
Subject: Re: [PATCH] RFC: possible fixing a preposition
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: Yang Lu <luyang.co@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

> No problem!  After all, if I were ever to have to write a document
> in Chinese, I would need quite a bit of help.  Like the help you are
> currently providing by doing this translation.  ;-)
I'm so flattered ;-).
It is a great honor for me to work with both of you.

> Very good!  How about as shown below?
> -add one to the global free-running \co{rcu_gp_ctr}
> +add the value one to the global free-running \co{rcu_gp_ctr}
I enjoy this commit very much.

Thank you
Cheers
Zhouyi
