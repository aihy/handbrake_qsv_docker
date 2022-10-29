FROM ubuntu:jammy
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y -q autoconf automake autopoint appstream build-essential cmake git libass-dev libbz2-dev libfontconfig1-dev libfreetype6-dev libfribidi-dev libharfbuzz-dev libjansson-dev liblzma-dev libmp3lame-dev libnuma-dev libogg-dev libopus-dev libsamplerate-dev libspeex-dev libtheora-dev libtool libtool-bin libturbojpeg0-dev libvorbis-dev libx264-dev libxml2-dev libvpx-dev m4 make meson nasm ninja-build patch pkg-config tar zlib1g-dev clang libva-dev libdrm-dev libmfx-dev libmfx1 libmfx-tools libva-drm2 libva-x11-2 libva-wayland2 libva-glx2 vainfo yasm wget vim locales less pkg-config gcc cmake intel-media-va-driver-non-free libva-dev libmfx-dev g++ libbluray-dev libx264-dev libx265-dev libass-dev
RUN cd /tmp && git clone https://github.com/HandBrake/HandBrake.git && cd HandBrake && ./configure --enable-qsv --disable-gtk --launch-jobs=$(nproc) --launch && make --directory=build install
ENV LIBVA_DRIVER_NAME iHD
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
RUN echo "C.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen
WORKDIR /media
