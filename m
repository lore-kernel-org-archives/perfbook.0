Return-Path: <SRS0=v+bS=KN=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G5McJYPGrnnHaoxy1PCMObxjhnRlB/hfn6gB9QjLdcQ=;
        b=O5qbGT+ZZOTss0iXWe/dwQt2VHdZVtApsM3uYoJ+st8m/1iKKiqnizWIc86U0uoZv4
         8NJhNbzHdV62CCvKwX9/yuFudOn9U1ZBCjYvYk/+BLpVeoc37snUQaolZ+ystaXf8yM5
         G4hKxY6dj//Nm10dVhkF2DIS/MxcIlBQWyMExlofn7QBHfDEuq+/YqihUgV8F6THh8Kc
         rZaO5J3FxBOvEvU40cPLz9DdHGv3ZDT3aSeZmMkVfcMNJPIGXbQ4IrVDowGM2e6Qur+Z
         /NDrFUXqxIDqM9A2RnvofmhyAK8J/+YfQv3rEY5XEd2qtjC68eJYSAae8aYH3bsWjZrc
         afhw==
MIME-Version: 1.0
References: <20210518161244.7340-1-zhouzhouyi@gmail.com> <20210518173524.GN4441@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210518173524.GN4441@paulmck-ThinkPad-P17-Gen-1>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Wed, 19 May 2021 02:21:54 +0800
Message-ID: <CAABZP2zJD40KwPH0mqSLU5Dvh-pNsaHYxFg7A4WmDSMd15H22A@mail.gmail.com>
Subject: Re: [PATCH] RFC: possible fixing a preposition
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: Yang Lu <luyang.co@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Thanks Paul for reviewing my incorrect proposal.

On Wed, May 19, 2021 at 1:35 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> In this case, "add" as in "addition" as in arithmetic, similar to the
> C-language "+=" operator.  But...
I see, my English is improved a lot by this case, thank you
>
> Would "add the value one to the global free-running rcu_gp_ctr variable"
> work better for you?
"add the value one to the global free-running rcu_gp_ctr variable" looks
great to me.

Thanks again
Cheers
Zhouyi
