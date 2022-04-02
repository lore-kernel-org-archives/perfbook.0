Return-Path: <SRS0=UzkD=UM=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=urNinVOTz2be2DdeV88MKo4vGsho0yBiU/TYn6Vqi6k=;
        b=X68llvu8KJmC8irnsr4QTaaCdtJcXj6MHGiB0MBpOdCVQwoZ2xP2/o+kKHBNdr20lJ
         wTZ5+TOAbcPRe1fu9uLxoL6HTY8RyT6mi5XFwd7uHH+8NHvrOu/7kZr1vhpzBqU6pxOn
         K3L5W7LjX1oHHQTHjzEB2tWD/hxw4Gvp2xeF1K06pPU9JNje2DTWskW+/JHSWqFF4B9x
         zZfbp2l/37OB7IPwjHI5MaVOq3ovrIMMIt5bnQErwqBtyEtdmiELsnjObvDteZyJCydi
         5ag/70LY18NpRMqw1xX9uzDK/pIzalHc2MtE/7y398Fe53lYKr4CwIc7oWTJCYL7yI/k
         3DPA==
MIME-Version: 1.0
From: Hao Lee <haolee.swjtu@gmail.com>
Date: Sat, 2 Apr 2022 15:57:01 +0800
Message-ID: <CA+PpKPnDa8T_VDgbc-C_TEEYjocrvRems+6aorUcbucRXV73rg@mail.gmail.com>
Subject: Question about formula (4.1)
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hello,

I'm confused about Figure 4.2 and the formula (4.1).

Anyone can clarify the confusion? Thanks.

On page 56, the book says:

1. LN is the number of lock acquisitions by N threads.

Question: Does this mean LN = sum of all the readcounts[i] ?

2. L1 is the number of lock acquisitions by a single thread

Question: which thread is L1 corresponding to? Is "a single thread"
selected randomly?

Thanks,
Hao Lee
