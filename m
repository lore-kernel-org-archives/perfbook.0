Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235860AbhLUPVG (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 21 Dec 2021 10:21:06 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B64DFC06173F
        for <perfbook@vger.kernel.org>; Tue, 21 Dec 2021 07:21:05 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bq20so29039661lfb.4
        for <perfbook@vger.kernel.org>; Tue, 21 Dec 2021 07:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=X956mEqUMcjp53uq6xkdG/dJf5MXVFKoP0jz/Mr8Fh8=;
        b=hwnh/Pt4+Dt3aNxcLi4E8WQ6+4X+/60UJcHZQwow0F5a7VBBOm7Qeju3gKn6c1u/Jh
         EOipvOA9VtTtf5jcbNzo5SpKiOjeNnvbbzop5vjtEflC+ALZgo2FexNAEn7MPD3jLHEs
         tjZ1xXgWuwT7I0/BbSuISx1MmBI9o8BWx8coadh/LOx/EikGHhyqg2kGphdGlZV5IYli
         jsY7YE42pEcyXOXIOAZkisheuqEbrIz7gPnTvAbRROfcPFktUIFDGyczNXyqiFCQHFeX
         33u6cHE6g3q3Dyiu4tMY3i6y9EZFFC0Y3A+wJBoi3qAKWi3Zq/YtHclDqJUJGbH4v3UM
         chBw==
MIME-Version: 1.0
From: Elad Lahav <e2lahav@gmail.com>
Date: Tue, 21 Dec 2021 10:20:52 -0500
Message-ID: <CAJbg=FWZG2EicBGKBbVzYnhH7oT3FqkwY738pmra9G9riGssVQ@mail.gmail.com>
Subject: Section 9.5: Nobody expects the Spanish Acquisition!
Content-Type: text/plain; charset="UTF-8"
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi Paul,

As promised, I have a potentially more interesting comment regarding
Section 9.5. Throughout this section, from the very first example, the
writer uses release semantics, but the readers are not obligated to
use acquire semantics, at least on sensible architectures (with
apologies to employees of HP nee Compaq nee Digital).

If I understand correctly, these relaxed semantics are the result of
an address dependency, with the data protected by the RCU critical
section residing in a structure whose address is stored by the pointer
dereferenced by a reader. The reader cannot consider any data outside
of this structure as protected by the critical section. This is a
critical point without which the examples won't work reliably.

Am I missing something? If not, I think that this point should be
emphasized early on, with a link to Section 15.2.3.

--Elad
