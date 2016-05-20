Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=kijOsQfupi666JaRHhDogFu3QhwhTXMeFPuW+PUqjjw=;
 b=dvyBWSlmXM3zNKBM/YcKZAUfjf4txakl85oc8WiDtsGDYbmP16OUkE8RKH6V669e6b
 EaYtIMAwgCGEg2JgJwNxqpBf3YRi0SY2PXyv1bRaWmtz1Ei1zwFCpVUIyrjCtEBvdpNM
 ju46fj6klixjKjdHxdFbgcWLQKe7HgNbaRv3Jyh1KjVW3yUfrADisbtDDLEMLnutpazt
 WtinGeNfMiSUms3hXwOkuEfLJcrPnUn2Dq1igwiAaQ9vXdiWu8PZ3dvTs6OrrHLc1Mmg
 EcEgvQN5nJARJ0MZr/6kiTZhie1o/Az+IW5p+Xf/ZnIeoYZlxGGi/t6n6oF33niFEy2b
 KprQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL] Fix false positive font warning and update related
 documents
Message-ID: <fa43435b-6096-8984-3f7e-495a40f0eff3@gmail.com>
Date: Sat, 21 May 2016 08:53:50 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The following changes since commit adc5a0ed9702d1fa2ec8620b1ff16ed2fbd6b9a4:

  Fix typo "baloon" -> "balloon" (2016-05-18 18:30:31 -0700)

are available in the git repository at:

  https://github.com/akiyks/perfbook.git fix-false-positive-v3

for you to fetch changes up to 810776b53db7b6194f6b2f0e0dd6a474e2090a91:

  Improve messages regarding font installation (2016-05-21 08:45:20 +0900)

----------------------------------------------------------------
Akira Yokosawa (2):
      Fix false positives in font check
      Improve messages regarding font installation

 FAQ-BUILD.txt         | 6 +++---
 howto/howto.tex       | 9 +++++----
 utilities/eps2pdf.sh  | 4 ++--
 utilities/runlatex.sh | 4 ++--
 4 files changed, 12 insertions(+), 11 deletions(-)

